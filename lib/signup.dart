import 'package:engage_files/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:engage_files/responsivescreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
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
              height: ResponsiveScreen.fullRepHeight(context, 400),
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
                    Icons.person_outline_sharp,
                    color: Colors.grey,
                    size: ResponsiveScreen.halfRepWidth(context, 22),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                    Icons.alternate_email_sharp,
                    color: Colors.grey,
                    size: ResponsiveScreen.halfRepWidth(context, 24),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: ResponsiveScreen.halfRepWidth(context, 16),
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                        border: const UnderlineInputBorder(),
                        contentPadding: const EdgeInsets.fromLTRB(8, 18, 8, 16),
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
                      controller: _textEditingController3,
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
                            _showpass
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
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

            // SizedBox(
            //   height: ResponsiveScreen.fullRepHeight(context, 100),
            // ),
            Spacer(),
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
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => signup()));
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
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => Loginscreen()));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        fontSize: ResponsiveScreen.halfRepWidth(context, 16),
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
    );
  }
}
