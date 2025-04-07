import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';

void main() {
  runApp(const ScheduleManagerApp());
}

class ScheduleManagerApp extends StatefulWidget {
  const ScheduleManagerApp({super.key});

  @override
  State<ScheduleManagerApp> createState() => _ScheduleManagerAppState();
}

class _ScheduleManagerAppState extends State<ScheduleManagerApp> {
  bool isLoggedIn = false;

  void onLoginSuccess() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: isLoggedIn
          ? const HomePage()
          : LoginPage(onLoginSuccess: onLoginSuccess),
    );
  }
}
