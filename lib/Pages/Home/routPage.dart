import 'package:engage_files/Pages/Home/home.dart';
import 'package:engage_files/Pages/Home/mycart.dart';
import 'package:engage_files/components/navigationBar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static PageController dashboardController = PageController();

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: DashboardScreen.dashboardController,
        children: [
          HomeScreen(),
          MyCart(),
        ],
      ),
      bottomNavigationBar: NavigationBarCustom(),
    );
  }
}
