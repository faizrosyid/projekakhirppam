import 'package:finpro/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'CurrencyConverterApp.dart';
import 'ProfilePage.dart';
import 'TimeConverterApp.dart';

void main() {
  runApp(NavBarApp());
}

class NavBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
        bottomNavigationBar: NavBar(),
      ),
      routes: {
        '/currency': (context) => CurrencyConverterApp(),
        '/time': (context) => TimeConverterApp(),
        '/profile': (context) => ProfilePage(
    name: 'A',
    // birthPlace: 'Sleman',
    // birthDate: '21 Agustus 2002',
    // age: 21,
    // hobby: 'Menonton film',
    impression:
    'Mata kuliah ini sangat memberikan pengalaman berarti bagi saya dalam pengembangan aplikasi mobile.',
    ),
      },
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny),
          label: 'Weather',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Currency',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Time',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/currency');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/time');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }
}