import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/builders.dart';

class AddNewCourse extends StatefulWidget {
  String userRole;
  AddNewCourse({super.key, required this.userRole});

  @override
  _AddNewCourseState createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  List<Color>? gradientColors;
  final _addNewCourseFormKey = GlobalKey<FormState>();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseShortNameController = TextEditingController();
  TextEditingController programmeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter, // Align to the top of the screen
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.cancel), // Add your cancel icon here
                          color: kDefaultIconDarkColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const Text(
                        "Add New Course",
                        style: TextStyle(
                          color: Palette.activeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: _addNewCourseFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            buildTextField(
                                CupertinoIcons.add, "Programme name", false, false, courseNameController),
                            buildTextField(CupertinoIcons.person, "Short name", false, false,
                                courseNameController),
                            buildTextField(CupertinoIcons.person, "Programme", false, false,
                                programmeController),

                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          if (_addNewCourseFormKey.currentState!.validate()) {
                            _showAddCourseConfirmationDialog(context);
                          }
                        },
                        child: Container(
                          width: 60, // Set the width and height to your desired size
                          height: 60, // Set the width and height to your desired size
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors ?? [Colors.orange, Colors.red], // Default gradient colors
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle, // Make the container a circle
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.userRole !=
            'admin') // Replace 'admin' with the role that should see the overlay
          const AccessDeniedOverlay()
      ],
    );
  }
  Future<void> _showAddCourseConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Add new Course'),
          content: const Text('Are you sure you want to add new Course?'),
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
