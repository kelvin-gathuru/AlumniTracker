import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino Icons
import '../config/config.dart';
import '../utilities/builders.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                          text: "Enter new",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " Password," ,
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
                      "Enter your a new password to reset your account",
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
            top: 430,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),

          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top:  230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height:  250,
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
                    buildResetPasswordSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            top: 430,
            showShadow: false,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )


          // Bottom buttons
        ],
      ),
    );
  }

  Container buildResetPasswordSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(CupertinoIcons.lock, "new password", true, false),
          buildTextField(CupertinoIcons.lock, "confirm password", true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Go to sign in?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )

        ],
      ),
    );
  }

}
