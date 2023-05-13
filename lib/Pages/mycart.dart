import 'package:engage_files/models/cartitemmodel.dart';
import 'package:engage_files/widgets/custom_card.dart';
import 'package:engage_files/widgets/topappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  final List<CartItemModel> cartItems = const [
    CartItemModel(
      brandName: 'Nike',
      name: 'Air Jordan XXXVI',
      qty: 1,
      price: 108,
      sizes: [9, 10],
      imgURL:
          'https://sneakernews.com/wp-content/uploads/2021/08/Air-Jordan-36-2021-54.jpg?w=1140',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: devicePadding.top + 55 + 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Cart',
                      style: TextStyle(fontFamily: 'RobotoBold', fontSize: 19),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...cartItems.map((e) => CustomItemCard(cartItemModel: e)),
                  SizedBox(
                    height: devicePadding.bottom > 0 ? devicePadding.bottom : 8,
                  )
                ],
              ),
            ),
            CustomTopAppBar(
              totalItems: cartItems.length,
            )
          ],
        ),
      ),
    );
  }
}
