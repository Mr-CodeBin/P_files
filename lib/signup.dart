import 'dart:developer';

import 'package:engage_files/login.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:engage_files/responsivescreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  bool _showpass = false;
  bool _showConfirmPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: ResponsiveScreen.fullRepHeight(context, 300),
                  alignment: Alignment.center,
                  child: Lottie.network(
                    "https://assets8.lottiefiles.com/packages/lf20_nUTP5Vd52q.json",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.roboto(
                      fontSize: ResponsiveScreen.halfRepWidth(context, 32),
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.halfRepHeight(context, 15),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 22),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _firstNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "First Name",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 22),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _lastNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.halfRepHeight(context, 18),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.alternate_email,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 22),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.halfRepHeight(context, 18),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 22),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          obscureText: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.halfRepHeight(context, 18),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.password_outlined,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 24),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_showpass,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showpass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                                size:
                                    ResponsiveScreen.halfRepWidth(context, 24),
                              ),
                              onPressed: () {
                                setState(() {
                                  _showpass = !_showpass;
                                });
                              },
                            ),
                            hintText: "Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            border: const UnderlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.halfRepHeight(context, 18),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.password_outlined,
                        color: Colors.grey,
                        size: ResponsiveScreen.halfRepWidth(context, 24),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _confirmPassController,
                          obscureText: !_showConfirmPass,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize:
                                  ResponsiveScreen.halfRepWidth(context, 16),
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _showConfirmPass = !_showConfirmPass;
                                });
                              },
                              child: Icon(
                                _showConfirmPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                                size:
                                    ResponsiveScreen.halfRepWidth(context, 24),
                              ),
                            ),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(8, 18, 8, 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: ResponsiveScreen.fullRepHeight(context, 44),
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: ResponsiveScreen.fullRepHeight(context, 44),
                    width: ResponsiveScreen.fullRepWidth(context, 358),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () async {
                        if (_firstNameController.text.trim().isEmpty) {
                          log("First Name is Empty");
                          return;
                        }
                        if (_lastNameController.text.trim().isEmpty) {
                          log("Last Name is Empty");
                          return;
                        }
                        if (_emailController.text.trim().isEmpty) {
                          log("Email is Empty");
                          return;
                        }
                        if (_phoneController.text.trim().isEmpty) {
                          log("Phone is Empty");
                          return;
                        }
                        if (_passwordController.text.trim().isEmpty) {
                          log("Password is Empty");
                          return;
                        }

                        if (_confirmPassController.text.trim().isEmpty) {
                          log("Confirm Password is Empty");
                          return;
                        }
                        if (_passwordController.text.trim() !=
                            _confirmPassController.text.trim()) {
                          log("Password and Confirm Password do not match");
                          return;
                        }

                        var resp = await CurrentUser.registerUser(
                          CurrentUser(
                            cart: [],
                            email: _emailController.text.trim(),
                            fav: [],
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            phoneNumber:
                                int.parse(_phoneController.text.trim()),
                            lastUpdated: DateTime.now(),
                            orders: [],
                            profilePicture: "",
                          ),
                          _passwordController.text.trim(),
                        );
                        log(resp.toString());
                        if (resp == "all is well") {
                          Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => Loginscreen()));
                        }
                        if (resp ==
                            "The account already exists for that email.") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: "Dismiss",
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                              content: Text(
                                "The account already exists for that email.",
                                style: GoogleFonts.montserrat(
                                  fontSize: ResponsiveScreen.halfRepWidth(
                                    context,
                                    12,
                                  ),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                        if (resp == "The password provided is too weak.") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: "Dismiss",
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                              content: Text(
                                "The password provided is too weak.",
                                style: GoogleFonts.montserrat(
                                  fontSize: ResponsiveScreen.halfRepWidth(
                                    context,
                                    12,
                                  ),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.montserrat(
                          fontSize: ResponsiveScreen.halfRepWidth(context, 24),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveScreen.fullRepHeight(context, 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: GoogleFonts.montserrat(
                        fontSize: ResponsiveScreen.halfRepWidth(context, 14),
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(2),
                      onTap: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) => Loginscreen()));
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.montserrat(
                            fontSize:
                                ResponsiveScreen.halfRepWidth(context, 16),
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveScreen.halfRepHeight(context, 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveScreen.fullRepHeight(context, 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
