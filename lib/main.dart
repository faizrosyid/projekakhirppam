import 'package:finpro/CurrencyConverterApp.dart';
import 'package:finpro/NavBarApp.dart';
import 'package:finpro/NavigationApp.dart';
import 'package:finpro/Screens/LoginForm.dart';
import 'package:finpro/TimeConverterApp.dart';
import 'package:finpro/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login With Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}

