import 'package:flutter/material.dart';
import 'package:quraanpage/pages/menu/menu_view.dart';
import 'package:quraanpage/pages/reservations/reservations_view.dart';
import 'package:quraanpage/pages/sessions/sessions_view.dart';
import 'package:quraanpage/pages/teachers/teachers_view.dart';

import 'home/home_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int currentIndex = 0;

  List<Widget> pages = [
    const HomeView(),
    const TeachersView(),
    const ReservationsView(),
    const SessionsView(),
    const MenuView(),
  ];
  List<String> labels = [
    "الرئيسية",
    "المعلمون",
    "الحجوزات",
    "الجلسات",
    "القائمة",
  ];

  List<Icon> icons = [
    const Icon(Icons.margin),
    const Icon(Icons.person),
    const Icon(Icons.account_balance_wallet),
    const Icon(Icons.add_chart),
    const Icon(Icons.menu),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: const Color(0xff9098B1),
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            icon: icons[index],
            backgroundColor:
                currentIndex == index ? Colors.green : const Color(0xff9098B1),
            label: labels[index],
          ),
        ),
      ),
    );
  }
}
