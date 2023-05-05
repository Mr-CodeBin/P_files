import 'package:engage_files/Pages/details.dart';
import 'package:engage_files/Pages/home.dart';
import 'package:engage_files/login.dart';
import 'package:engage_files/responsivescreen.dart';
import 'package:flutter/material.dart';

void main() {
  ResponsiveScreen.ScreenHeight = 844;
  ResponsiveScreen.ScreenWidth = 390;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Details(),
      // Loginscreen(),
    );
  }
}
