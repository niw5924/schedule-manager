import 'package:flutter/material.dart';
import '../reservation/reservation_page.dart';
import '../customer/customer_page.dart';
import '../sales/sales_page.dart';
import '../menu/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ReservationPage(),
    CustomerPage(),
    SalesPage(),
    MenuPage(),
  ];

  final List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '예약'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: '고객'),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '매출'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: '메뉴'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomItems,
        backgroundColor: const Color(0xFF1A1F24),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
