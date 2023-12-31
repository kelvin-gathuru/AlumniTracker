import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino Icons
import 'package:fluttertoast/fluttertoast.dart';
import '../config/config.dart';
import '../utilities/builders.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _forgotPasswordEmailController = TextEditingController();
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Forgot your",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " Password?,",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Enter your email we will send you otp to reset your password",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(
            context: context,
            showShadow: true,
            gradientColors: [
              Colors.orange,
              Colors.red
            ], // Customize gradient colors
            onPressed: () {
              if (_forgotPasswordFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'forgot_password_otp');
                Fluttertoast.showToast(
                  msg: "OTP Code Sent",
                  toastLength: Toast.LENGTH_SHORT,
                  // Duration for the toast (SHORT or LONG)
                  gravity: ToastGravity.BOTTOM,
                  // Toast position (TOP, BOTTOM, CENTER)
                  timeInSecForIosWeb: 1,
                  // Duration for iOS and web
                  backgroundColor: Colors.black54,
                  // Background color of the toast
                  textColor: Colors.white,
                  // Text color of the toast message
                  fontSize: 16.0, // Font size of the toast message
                );
              }
            },
          ),

          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 220,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              const Text(
                                "RESET PASSWORD",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.textColor1),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    buildForgotPasswordSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            showShadow: false,
            gradientColors: [
              Colors.orange,
              Colors.red
            ], // Customize gradient colors
            onPressed: () {
              if (_forgotPasswordFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'forgot_password_otp');
                Fluttertoast.showToast(
                  msg: "OTP Code Sent",
                  toastLength: Toast.LENGTH_SHORT,
                  // Duration for the toast (SHORT or LONG)
                  gravity: ToastGravity.BOTTOM,
                  // Toast position (TOP, BOTTOM, CENTER)
                  timeInSecForIosWeb: 1,
                  // Duration for iOS and web
                  backgroundColor: Colors.black54,
                  // Background color of the toast
                  textColor: Colors.white,
                  // Text color of the toast message
                  fontSize: 16.0, // Font size of the toast message
                );
              }
            },
          )

          // Bottom buttons
        ],
      ),
    );
  }

  Container buildForgotPasswordSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Form(
            key: _forgotPasswordFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction, // Set autovalidateMode
            child: buildTextField(CupertinoIcons.mail, "email", false, true,_forgotPasswordEmailController),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Back to sign up?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }
}
