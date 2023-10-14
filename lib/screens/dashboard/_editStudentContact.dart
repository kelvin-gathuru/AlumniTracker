import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/builders.dart';

class EditStudentContact extends StatefulWidget {
  String userRole;
  EditStudentContact({super.key, required this.userRole});

  @override
  _EditStudentContactState createState() => _EditStudentContactState();
}

class _EditStudentContactState extends State<EditStudentContact> {
  List<Color>? gradientColors;
  final _editStudentContactFormKey = GlobalKey<FormState>();
  final mobileNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final alternativeMobileNumberController = TextEditingController();

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
                          icon: Icon(Icons.cancel), // Add your cancel icon here
                          color: kDefaultIconDarkColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const Text(
                        "Edit Student Contact",
                        style: TextStyle(
                          color: Palette.activeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: _editStudentContactFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            buildTextField(
                                CupertinoIcons.phone, "Mobile Number", false, false,
                                mobileNumberController),
                            buildTextField(
                                CupertinoIcons.mail, "Email Address", false, true,
                                emailAddressController),
                            buildTextField(
                                CupertinoIcons.phone,
                                "Alternative Mobile Number",
                                false,
                                false,
                                alternativeMobileNumberController),

                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          if (_editStudentContactFormKey.currentState!.validate()) {
                            _showEditStudentContactConfirmationDialog(context);
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
  Future<void> _showEditStudentContactConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Edit Student Contact'),
          content: const Text('Are you sure you want to edit student contact?'),
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
