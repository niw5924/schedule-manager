import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(const ScheduleManagerApp());
}

class ScheduleManagerApp extends StatelessWidget {
  const ScheduleManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
