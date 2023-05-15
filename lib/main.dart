import 'package:engage_files/Pages/Home/routPage.dart';
import 'package:engage_files/Pages/details.dart';
import 'package:engage_files/Pages/Home/home.dart';
import 'package:engage_files/Pages/Home/mycart.dart';
import 'package:engage_files/login.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:engage_files/responsivescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: CurrentUser.currentUser == false
          ? const DashboardScreen()
          : const Loginscreen(),
    );
  }
}
