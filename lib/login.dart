import 'package:engage_files/Pages/Home/home.dart';
import 'package:engage_files/Pages/Home/routPage.dart';
import 'package:engage_files/forgotpass.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:engage_files/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:engage_files/responsivescreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailContorller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _showpass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ResponsiveScreen.fullRepHeight(context, 360),
              alignment: Alignment.center,
              child: Lottie.asset(
                "lottie/loginScreenAnimation.json",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Login",
                style: GoogleFonts.roboto(
                  fontSize: ResponsiveScreen.halfRepWidth(context, 32),
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            SizedBox(
              height: ResponsiveScreen.halfRepHeight(context, 50),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 28, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.alternate_email_sharp,
                    color: Colors.grey,
                    size: ResponsiveScreen.halfRepWidth(context, 24),
                  ),
                  Expanded(
                    child: TextField(
                      controller: emailContorller,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: ResponsiveScreen.halfRepWidth(context, 16),
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
                    Icons.lock_outline,
                    color: Colors.grey,
                    size: ResponsiveScreen.halfRepWidth(context, 24),
                  ),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: !_showpass,
                      decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: ResponsiveScreen.halfRepWidth(context, 16),
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _showpass = !_showpass;
                            });
                          },
                          child: Icon(
                            _showpass ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                            size: ResponsiveScreen.halfRepWidth(context, 24),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 24.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.roboto(
                          fontSize: ResponsiveScreen.halfRepWidth(context, 16),
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveScreen.fullRepHeight(context, 56),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GestureDetector(
                onTap: () async {
                  if (emailContorller.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill all the fields"),
                      ),
                    );
                    return;
                  }

                  var resp = await CurrentUser.loginUser(
                    emailContorller.text.trim(),
                    passwordController.text.trim(),
                  );

                  if (resp == "No user found for that email.") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(resp.toString()),
                      ),
                    );
                    return;
                  }
                  if (resp == "Wrong password provided for that user.") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(resp),
                      ),
                    );
                    return;
                  }
                  if (resp == "exception error") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(resp),
                      ),
                    );
                    return;
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DashboardScreen()));
                },
                child: Container(
                  height: 44,
                  width: ResponsiveScreen.fullRepWidth(context, 358),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
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
                  "I am a new user! ",
                  style: GoogleFonts.montserrat(
                    fontSize: ResponsiveScreen.halfRepWidth(context, 14),
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(2),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                        fontSize: ResponsiveScreen.halfRepWidth(context, 14),
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
              height: ResponsiveScreen.fullRepHeight(context, 40),
            ),
          ],
        ),
      ),
    );
  }
}
