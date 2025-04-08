import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/auth_provider.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider()..checkAutoLogin(),
      child: const ScheduleManagerApp(),
    ),
  );
}

class ScheduleManagerApp extends StatelessWidget {
  const ScheduleManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return MaterialApp(
          title: 'Schedule Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: auth.user != null ? const HomePage() : const LoginPage(),
        );
      },
    );
  }
}
