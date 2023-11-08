import 'package:oasis_infobyte_internship/unit_converter/widget/length.dart';
import 'package:oasis_infobyte_internship/unit_converter/widget/temperature.dart';
import 'package:oasis_infobyte_internship/unit_converter/widget/time.dart';
import 'package:oasis_infobyte_internship/unit_converter/widget/weight.dart';
import 'package:flutter/material.dart';

class Convert extends StatefulWidget {
  const Convert({super.key});

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  static const List<Map<String, dynamic>> navList = [
    {"text": "Distance", "route": Length(), "icon": Icons.linear_scale},
    {"text": "Temperature", "route": Temperature(), "icon": Icons.thermostat},
    {"text": "Time", "route": Time(), "icon": Icons.access_time},
    {"text": "Mass", "route": Weight(), "icon": Icons.punch_clock},
  ];

  int selectedIndex = 0;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 34, 66, 98),
              Color(0xFF243748),
              Color(0xFF244075),
              Color.fromARGB(255, 2, 19, 34),
              Color.fromARGB(255, 2, 19, 15),
            ],
          ),
        ),
        child: navList[selectedIndex]['route'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        items: [
          for (final elm in navList)
            BottomNavigationBarItem(
              icon: Icon(
                elm['icon'],
              ),
              label: elm['text'],
            ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}
