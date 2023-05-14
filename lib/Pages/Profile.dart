import 'package:engage_files/components/navigationBar.dart';
import 'package:engage_files/login.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:engage_files/responsivescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          NavigationBarCustom.currentIndex = 0;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Loginscreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.power_settings_new_sharp,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Column(
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
                              CurrentUser.currentUser!.profilePicture
                                      .toString()
                                      .trim()
                                      .isEmpty
                                  ? "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80"
                                  : CurrentUser.currentUser!.profilePicture!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                CurrentUser.currentUser!.firstName +
                                    " " +
                                    CurrentUser.currentUser!.lastName,
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue[600],
                                  fontSize: ResponsiveScreen.halfRepWidth(
                                      context, 32),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            //sized box
                            SizedBox(
                              height:
                                  ResponsiveScreen.halfRepHeight(context, 18),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "No. of orders:",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.blue[800],
                                          fontSize:
                                              ResponsiveScreen.halfRepWidth(
                                                  context, 16),
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      Text(
                                        "5",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.deepPurpleAccent,
                                          fontSize:
                                              ResponsiveScreen.halfRepWidth(
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
                                          fontSize:
                                              ResponsiveScreen.halfRepWidth(
                                                  context, 16),
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      Text(
                                        CurrentUser.currentUser!.cart.length
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.deepPurpleAccent,
                                          fontSize:
                                              ResponsiveScreen.halfRepWidth(
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
                        "Phone Number:",
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
                        CurrentUser.currentUser!.phoneNumber.toString(),
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
                        CurrentUser.currentUser!.email.toString(),
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
