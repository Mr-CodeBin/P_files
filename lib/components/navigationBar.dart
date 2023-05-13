import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavigationBarCustom extends StatefulWidget {
  const NavigationBarCustom({super.key});
  static int currentIndex = 0;
  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              NavigationBarCustom.currentIndex = 0;
            });
          },
          child: NavBarIcon(
            icon: Icons.home,
            text: "Home",
            index: 0,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              NavigationBarCustom.currentIndex = 2;
            });
          },
          child: NavBarIcon(
            icon: Icons.shopping_cart,
            text: "Cart",
            index: 2,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              NavigationBarCustom.currentIndex = 3;
            });
          },
          child: NavBarIcon(
            icon: Icons.person,
            text: "Profile",
            index: 3,
          ),
        ),
      ],
    ));
  }
}

class NavBarIcon extends StatefulWidget {
  IconData icon;
  String text;
  int index;
  void Function()? onTap;
  NavBarIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
    this.onTap,
  });

  @override
  State<NavBarIcon> createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: NavigationBarCustom.currentIndex == widget.index
                ? Color(0xffFF6E00)
                : Color(0xffC4C4C4),
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: NavigationBarCustom.currentIndex == widget.index
                  ? Color(0xffFF6E00)
                  : Color(0xffC4C4C4),
            ),
          ),
        ],
      ),
    );
  }
}
