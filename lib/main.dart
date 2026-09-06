 import 'package:flutter/material.dart';

void main() {
  runApp(const FlyWiseApp());
}

class FlyWiseApp extends StatelessWidget {
  const FlyWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlyWise',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123B5D),
        ),
      ),
      home: const FlyWiseHome(),
    );
  }
}

class FlyWiseHome extends StatelessWidget {
  const FlyWiseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'FlyWise',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'سافر وأنت تعرف كل ما يهمك.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              height: 1.15,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'معلومات واضحة عن رحلتك، أمتعتك، مطارك وحقوقك.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF123B5D),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'رحلتي',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'أدخل تفاصيل رحلتك',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 18),

                FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TripDetailsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('ابدأ الآن'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF123B5D),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  icon: Icons.luggage,
                  title: 'أمتعتي',
                  subtitle: 'الوزن والحقائب',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FeatureCard(
                  icon: Icons.flight_takeoff,
                  title: 'المطار',
                  subtitle: 'الخدمات والمرافق',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  icon: Icons.gavel,
                  title: 'حقوقي',
                  subtitle: 'التأخير والإلغاء',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FeatureCard(
                  icon: Icons.public,
                  title: 'التأشيرة',
                  subtitle: 'متطلبات الدخول',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                child: Icon(Icons.auto_awesome),
              ),
              title: const Text(
                'اسأل FlyWise',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: const Text(
                'اسأل عن أي شيء يتعلق برحلتك.',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  final TextEditingController departureController =
      TextEditingController();

  final TextEditingController destinationController =
      TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    departureController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 730),
      ),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text(
          'رحلتي',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'لنبدأ بتفاصيل رحلتك ✈️',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'أدخل معلومات الرحلة وسنجهز لك كل ما تحتاج إلى معرفته.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 28),

          TextField(
            controller: departureController,
            decoration: InputDecoration(
              labelText: 'من',
              hintText: 'مدينة أو مطار المغادرة',
              prefixIcon: const Icon(Icons.flight_takeoff),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: destinationController,
            decoration: InputDecoration(
              labelText: 'إلى',
              hintText: 'مدينة أو مطار الوصول',
              prefixIcon: const Icon(Icons.flight_land),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          InkWell(
            onTap: selectDate,
            borderRadius: BorderRadius.circular(18),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'تاريخ الرحلة',
                prefixIcon: const Icon(Icons.calendar_month),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              child: Text(
                selectedDate == null
                    ? 'اختر تاريخ الرحلة'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                style: TextStyle(
                  fontSize: 16,
                  color: selectedDate == null
                      ? Colors.grey.shade600
                      : Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),

          SizedBox(
            height: 56,
            child: FilledButton.icon(
              onPressed: () {
                if (departureController.text.trim().isEmpty ||
                    destinationController.text.trim().isEmpty ||
                    selectedDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'يرجى إدخال المغادرة والوجهة والتاريخ.',
                      ),
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'تم حفظ تفاصيل الرحلة بنجاح.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'متابعة',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color(0xFF123B5D),
            ),
            const SizedBox(height: 22),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
