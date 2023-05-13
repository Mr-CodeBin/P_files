import 'dart:developer';

import 'package:engage_files/Pages/Home/home.dart';
import 'package:engage_files/models/firestore_model.dart';
import 'package:engage_files/models/products.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:engage_files/responsivescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatefulWidget {
  int index;
  Details({super.key, required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late bool fav = true;

  List<String> imgList = [
    'https://images.pexels.com/photos/3335016/pexels-photo-3335016.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1990209/pexels-photo-1990209.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/16668378/pexels-photo-16668378.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/731151/pexels-photo-731151.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => HomeScreen(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    Text(
                      'Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          fav = !fav;
                        });
                      }),
                      icon: fav
                          ? Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width, //double.infinity,
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5),
                child: PageView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                imgList[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              productData[widget.index]['name'].length >
                                      ResponsiveScreen.fullRepWidth(context, 22)
                                          .round()
                                  ? productData[widget.index]['name'].substring(
                                          0,
                                          ResponsiveScreen.fullRepWidth(
                                                  context, 22)
                                              .round()) +
                                      '...'
                                  : productData[widget.index]['name'],
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 15, right: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              productData[widget.index]['price']
                                  .toString()
                                  .replaceAll('C', " ")
                                  .replaceAll('to ', "-")
                                  .trim(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 20),
                            child: Text(
                              productData[widget.index]['description'],
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (CurrentUser.currentUser?.cart
                          .contains(productData[widget.index]) ==
                      true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Already in cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    return;
                  }
                  CurrentUser.currentUser?.cart == null
                      ? [productData[widget.index]]
                      : CurrentUser.currentUser!.cart.add(
                          productData[widget.index],
                        );
                  await FirestoreUserData.setMyCart(
                      CurrentUser.currentUserUid!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue[100],
                      content: Text('Added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    'Add to Cart',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (CurrentUser.currentUser?.orders
                          .contains(productData[widget.index]) ==
                      true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Already ordered'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    return;
                  }
                  CurrentUser.currentUser?.orders == null
                      ? [productData[widget.index]]
                      : CurrentUser.currentUser!.orders.add(
                          productData[widget.index],
                        );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    'Buy Now',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
