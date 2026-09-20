import 'package:flutter/material.dart';

void main() {
  runApp(const OutsoleLogApp());
}

class OutsoleLogApp extends StatelessWidget {
  const OutsoleLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outsole Log',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFFFF8A00),
        useMaterial3: true,
      ),
      home: const OutsoleHome(),
    );
  }
}

class OutsoleHome extends StatelessWidget {
  const OutsoleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'OUTSOLE LOG',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}