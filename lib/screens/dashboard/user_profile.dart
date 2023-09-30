import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../utilities/builders.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

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
            top: 530,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),

          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top:  200,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height:  500,
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
                    buildUserProfileSection(),
                    const SizedBox(height: 24.0),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "edit_profile");
                        },
                        child: const Text("Edit Profile"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "change_password");
                        },
                        child: const Text("Change Password"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _showLogoutConfirmationDialog(context);
                        },
                        child: const Text("Log Out"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(
            context: context,
            top: 660,
            showShadow: false,
            gradientColors: [Colors.orange, Colors.red], // Customize gradient colors
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          )


          // Bottom buttons
        ],
      ),
    );
  // }
}
  Container buildUserProfileSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(height: 16.0),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),

        ],
      ),
    );
  }
  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle logout here
                Navigator.pushNamed(context, "/"); // Close the dialog
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

}
