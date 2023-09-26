import 'package:flutter/material.dart';
import '../config/config.dart';
import '../utilities/builders.dart';

class VerifyAccountOtp extends StatefulWidget {
  const VerifyAccountOtp({super.key});

  @override
  _VerifyAccountOtpState createState() => _VerifyAccountOtpState();
}

class _VerifyAccountOtpState extends State<VerifyAccountOtp> {
  final List<FocusNode> _otpFocusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.isNotEmpty) {
          if (i < _otpControllers.length - 1) {
            FocusScope.of(context).requestFocus(_otpFocusNodes[i + 1]);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpFocusNodes[i].dispose();
      _otpControllers[i].dispose();
    }
    super.dispose();
  }

  Widget buildOtpField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < _otpControllers.length; i++)
          buildOtpDigitField(i),
      ],
    );
  }

  Widget buildOtpDigitField(int index) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: const InputDecoration(
          counter: Offstage(),
          border: InputBorder.none,
        ),
        focusNode: _otpFocusNodes[index],
        controller: _otpControllers[index],
        onChanged: (value) {
          if (value.isEmpty) {
            if (index > 0) {
              FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
            }
          } else {
            if (index < _otpControllers.length - 1) {
              FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
            }
          }
        },
      ),
    );
  }
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
                          text: "A 6 digit otp code has been sent to your email",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " email!" ,
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
                      "Enter the otp code to verify your account password.",
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
              height:  220,
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
                                "ENTER THE OTP CODE",
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
                    buildVerifyAccountOtpSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            showShadow: false,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),

          // Bottom buttons
        ],
      ),
    );
  }

  Container buildVerifyAccountOtpSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildOtpField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Did not receive the otp code?",
                  style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Resend?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )

        ],
      ),
    );
  }

}
