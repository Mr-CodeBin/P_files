import 'package:engage_files/models/cartitemmodel.dart';
import 'package:flutter/material.dart';

import 'cartitemsizebutton.dart';

class CustomItemCard extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CustomItemCard({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width - 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 130,
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(image: NetworkImage(cartItemModel.imgURL), fit: BoxFit.cover),
              boxShadow: const [BoxShadow(color: Color.fromARGB(23, 0, 0, 0), blurRadius: 10)]
            ),
          ),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItemModel.brandName, style: const TextStyle(color: Colors.grey, fontFamily: 'RobotoMedium'),),
              const SizedBox(height: 5,),
              Text(cartItemModel.name, style: const TextStyle(color: Colors.black, fontFamily: 'RobotoMedium', fontSize: 19),),
              const Expanded(child: SizedBox()),
              const Text('Size', style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontFamily: 'RobotoBold'),),
              const SizedBox(height: 5,),
              SizedBox(
                height: 35,
                width: size.width - 40 - 12 - 130,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CartItemSizeButton(size: cartItemModel.size1, isActive: false),
                    const SizedBox(width: 8,),
                    CartItemSizeButton(size: cartItemModel.size2, isActive: true),
                    const Expanded(child: SizedBox()),
                    Text('${cartItemModel.qty}x', style: const TextStyle(fontFamily: 'RobotoMedium', color: Colors.grey, fontSize: 12),),
                    Text(' \$${double.parse(cartItemModel.price.toStringAsFixed(2))}', style: const TextStyle(fontFamily: 'RobotoBold', color: Colors.black, fontSize: 20),),
                  ],
                ),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
