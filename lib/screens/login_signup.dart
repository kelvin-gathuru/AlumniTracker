import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino Icons
import 'package:fluttertoast/fluttertoast.dart';
import '../config/config.dart';
import '../utilities/builders.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _regEmailController = TextEditingController();
  final TextEditingController _regUsernameController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  bool isSignupScreen = false;
  bool isRememberMe = false;
  String selectedRole = "Industrial Coordination Officer"; // Default role

  // Define the roles and their icons
  final List<String> roles = [
    "Industrial Coordination Officer",
    "Trainer",
    "Alumni Officer",
    "IT Department Staff",
  ];

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
                          text: "Welcome to",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Alumni Tracker," : " Back,",
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
                    Text(
                      isSignupScreen
                          ? "Sign up to Continue"
                          : "Sign in to Continue",
                      style: const TextStyle(
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
            top: isSignupScreen ? 535.0 : 430.0,
            gradientColors: [Colors.orange, Colors.red],
            onPressed: isSignupScreen ? () {
              if (_signupFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'verify_account_otp');
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
            }:() {
              if (_loginFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'dashboard');
                Fluttertoast.showToast(
                  msg: "Success",
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
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
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
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSignInSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            showShadow: false,
            top: isSignupScreen ? 535.0 : 430.0,
            gradientColors: [Colors.orange, Colors.red],
            onPressed: isSignupScreen ? () {
              if (_signupFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'verify_account_otp');
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
            }:() {
              if (_loginFormKey.currentState!.validate()) {
                Navigator.pushNamed(context, 'dashboard');
                Fluttertoast.showToast(
                  msg: "Success",
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
          // Bottom buttons
        ],
      ),
    );
  }
// Function to build the dropdown field
  Widget buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Who am I?",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Palette.textColor1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Palette.textColor1),
            ),
            child: DropdownButton<String>(
              value: selectedRole,
              icon: const Icon(CupertinoIcons.arrow_down, color: Palette.iconColor),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              underline: Container(
                height: 0,
              ),
              items: roles.map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Row(
                    children: [
                      // Add icons here based on the role
                      Icon(
                        getIconForRole(role),
                        color: Palette.iconColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        role,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Palette.textColor1,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(), onChanged: (String? value) { setState(() {
              selectedRole = value!;
            }); },
            ),
          ),
        ],
      ),
    );
  }

  // Function to get the icon for a specific role
  IconData getIconForRole(String role) {
    switch (role) {
      case "Industrial Coordination Officer":
        return Icons.business;
      case "Trainer":
        return Icons.person;
      case "Alumni Officer":
        return Icons.school;
      case "IT Department Staff":
        return Icons.computer;
      default:
        return Icons.person;
    }
  }
  Container buildSignInSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Form(
            key: _loginFormKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                buildTextField(CupertinoIcons.mail, "email", false, true, _emailController),
                buildTextField(CupertinoIcons.lock, "password", true, false, _passwordController),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text("Remember me",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'forgot_password');
                },
                child: const Text("Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Form(
            key: _signupFormKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                buildTextField(CupertinoIcons.person, "username", false, false, _regUsernameController),
                buildTextField(CupertinoIcons.mail, "email", false, true, _regEmailController),
                buildTextField(CupertinoIcons.lock, "password", true, false, _regPasswordController),
                // Add the dropdown field
                buildDropdownField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
