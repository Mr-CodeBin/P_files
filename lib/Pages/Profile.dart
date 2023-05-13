import 'package:engage_files/responsivescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveScreen.halfRepHeight(context, 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: ResponsiveScreen.fullRepHeight(context, 500),
                width: ResponsiveScreen.fullRepWidth(context, 390),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: ResponsiveScreen.halfRepHeight(context, 50),
                    // ),
                    Container(
                      height: ResponsiveScreen.fullRepHeight(context, 180),
                      width: ResponsiveScreen.fullRepWidth(context, 170),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(600),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(600),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Sandra Evans",
                            style: GoogleFonts.montserrat(
                              color: Colors.blue[600],
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 32),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        //sized box
                        SizedBox(
                          height: ResponsiveScreen.halfRepHeight(context, 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "No. of orders:",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.blue[800],
                                      fontSize: ResponsiveScreen.halfRepWidth(
                                          context, 16),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Text(
                                    "05",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: ResponsiveScreen.halfRepWidth(
                                          context, 18),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Cart Items:",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.blue[800],
                                      fontSize: ResponsiveScreen.halfRepWidth(
                                          context, 16),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Text(
                                    "24",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: ResponsiveScreen.halfRepWidth(
                                          context, 18),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ResponsiveScreen.halfRepHeight(context, 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: ResponsiveScreen.fullRepHeight(context, 100),
                width: ResponsiveScreen.fullRepWidth(context, 390),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(12, 8),
                    topRight: Radius.elliptical(12, 8),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ResponsiveScreen.halfRepHeight(context, 10),
                      ),
                      Text(
                        "Number:",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: ResponsiveScreen.halfRepWidth(context, 20),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 0.9,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                      ),
                      Text(
                        "79910927326",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: ResponsiveScreen.halfRepWidth(context, 18),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveScreen.halfRepHeight(context, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ResponsiveScreen.halfRepHeight(context, 4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: ResponsiveScreen.fullRepHeight(context, 100),
                width: ResponsiveScreen.fullRepWidth(context, 390),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(12, 8),
                    bottomRight: Radius.elliptical(12, 8),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ResponsiveScreen.halfRepHeight(context, 10),
                      ),
                      Text(
                        "Email:",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: ResponsiveScreen.halfRepWidth(context, 20),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 0.9,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                      ),
                      Text(
                        "SandraEvans982@fimale.com",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: ResponsiveScreen.halfRepWidth(context, 18),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveScreen.halfRepHeight(context, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
