import 'package:finpro/pages/home.dart';
import 'package:finpro/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'CurrencyConverterApp.dart';
import 'ProfilePage.dart';
import 'TimeConverterApp.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatefulWidget {
  @override
  _NavigationAppState createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    Home(),
    HomePage(),
    // TimeConverterApp(),
    // CurrencyConverterApp(),
    ProfilePage(
      name: 'KELOMPOK 12',
      // birthPlace: 'Sleman',
      // birthDate: '21 Agustus 2002',
      // age: 21,
      // hobby: 'Menonton film',
      impression:
      'JALU WRUHANTARA | FAIZ ROSYID',
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple, // Warna aktif
          unselectedItemColor: Colors.grey, // Warna tidak aktif
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'NewsApp',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'WeatherApp',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.access_time),
            //   label: 'Time Converter',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.attach_money),
            //   label: 'Currency Converter',
            // ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}