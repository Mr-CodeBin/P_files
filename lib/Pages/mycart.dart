import 'package:engage_files/models/cartitemmodel.dart';
import 'package:engage_files/widgets/custom_card.dart';
import 'package:engage_files/widgets/topappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  final List<CartItemModel> cartItems = const[
    CartItemModel(brandName: 'Nike', name: 'Air Jordan XXXVI', qty: 1, price: 108, size1: 9, size2: 10, imgURL: 'https://sneakernews.com/wp-content/uploads/2021/08/Air-Jordan-36-2021-54.jpg?w=1140'),
    CartItemModel(brandName: 'Nike', name: 'Air Jordan I Low', qty: 1, price: 129, size1: 9, size2: 10, imgURL: 'https://i.pinimg.com/564x/79/e3/22/79e322d4242065900802d88879434e3c.jpg'),
    CartItemModel(brandName: 'Adidas', name: 'Concept M', qty: 2, price: 349, size1: 10, size2: 11, imgURL: 'https://images.unsplash.com/photo-1518002171953-a080ee817e1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
    CartItemModel(brandName: 'New Balance', name: '997H Grey Day', qty: 1, price: 249, size1: 8, size2: 10, imgURL: 'https://images.unsplash.com/photo-1621315271772-28b1f3a5df87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
  ];
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: devicePadding.top + 55 + 20,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('My Cart', style: TextStyle(fontFamily: 'RobotoBold', fontSize: 19),),
                  ),
                  const SizedBox(height: 5,),
                  ...cartItems.map((e) => CustomItemCard(cartItemModel: e))
                ],
              ),
            ),
            CustomTopAppBar(totalItems: cartItems.length,)
          ],
        ),
      ),
    );
  }
}