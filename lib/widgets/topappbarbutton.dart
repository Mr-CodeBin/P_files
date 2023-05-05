import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopAppBarButton extends StatelessWidget {
  final IconData icon;
  const TopAppBarButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    Color iconColor = icon==CupertinoIcons.chevron_back?Colors.black:const Color.fromARGB(255, 128, 128, 128);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color.fromARGB(255, 206, 206, 206)),
        borderRadius: const BorderRadius.all(Radius.circular(25))
      ),
      child: Center(
        child: Icon(
          icon, 
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}