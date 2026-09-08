
import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text(
            'FlyWise',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
