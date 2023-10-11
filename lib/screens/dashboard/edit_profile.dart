import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino Icons
import '../../config/config.dart';
import '../../utilities/builders.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Back",
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
            top: 400,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              if (_editProfileFormKey.currentState!.validate()) {
                _showChangeUsernameConfirmationDialog(context);
              }
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
              height:  200,
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
                                "EDIT PROFILE",
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
                    const Text(
                      "Update your username",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        color: Palette.activeColor,
                      ),
                    ),
                    buildEditProfileSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            top: 400,
            showShadow: false,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              if (_editProfileFormKey.currentState!.validate()) {
                _showChangeUsernameConfirmationDialog(context);
              }

            },
          )


          // Bottom buttons
        ],
      ),
    );
  }

  Container buildEditProfileSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Form(
            key: _editProfileFormKey,
            autovalidateMode: AutovalidateMode.disabled,
           child: buildTextField(CupertinoIcons.lock, "username", false, false,_usernameController),
          ),
        ],
      ),
    );
  }
  Future<void> _showChangeUsernameConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Change Username'),
          content: const Text('Are you sure you want to change your username?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle change password here
              },
              child: const Text('Sure'),
            ),
          ],
        );
      },
    );
  }
}
