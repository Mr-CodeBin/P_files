import 'package:flutter/material.dart';

class CartItemSizeButton extends StatelessWidget {
  final int size;
  final bool isActive;
  const CartItemSizeButton({
    super.key,
    required this.size,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: !isActive ? Colors.transparent : Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(17.5)),
          border: !isActive
              ? Border.all(width: 0.5, color: Colors.grey)
              : Border.all()),
      child: Center(
        child: Text(
          size.toString(),
          style: TextStyle(
              fontFamily: 'RobotoRegular',
              color: !isActive ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
