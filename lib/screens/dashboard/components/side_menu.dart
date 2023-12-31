
import 'package:alumni_tracker/screens/dashboard/alumni_centre.dart';
import 'package:alumni_tracker/screens/dashboard/faqs_and_feedback.dart';
import 'package:alumni_tracker/screens/dashboard/student_centre.dart';
import 'package:alumni_tracker/screens/dashboard/dashboard.dart';
import 'package:alumni_tracker/screens/dashboard/trainer_appraisal.dart';
import 'package:alumni_tracker/screens/login_signup.dart';
import 'package:alumni_tracker/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../config/config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                child: Image.asset(
              "assets/images/brand.png",
            )),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: " Dashboard ",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: " Students",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentCentre()),
              );
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.bookmark,
            title: "Alumni",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlumniCentre()),
              );
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.chat,
            title: "Trainer Feedback/Appraisal",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrainerAppraisal()),
              );
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.settings,
            title: "Help/FAQs",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FaqsAndFeedbackPage()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/background.png",
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: kLightBlue, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Save all details and log out",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Log out", style: TextStyle(color: kDarkBlue)),
                    InkWell(
                      onTap: () {
                        _showLogoutConfirmationDialog(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: kDarkBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_circle_right,
                          color: kDarkBlue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
