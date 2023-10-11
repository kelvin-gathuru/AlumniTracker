import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/builders.dart';

class AddNewProgramme extends StatefulWidget {
  @override
  _AddNewProgrammeState createState() => _AddNewProgrammeState();
}

class _AddNewProgrammeState extends State<AddNewProgramme> {
  List<Color>? gradientColors;
  final _addNewProgrammeFormKey = GlobalKey<FormState>();
  TextEditingController programmeNameController = TextEditingController();
  TextEditingController programmeShortNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
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
                    "Add New Programme",
                    style: TextStyle(
                      color: Palette.activeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _addNewProgrammeFormKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        buildTextField(
                            CupertinoIcons.add, "Programme name", false, false, programmeNameController),
                        buildTextField(CupertinoIcons.person, "Short name", false, false,
                            programmeShortNameController),

                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      if (_addNewProgrammeFormKey.currentState!.validate()) {
                        _showAddProgrammeConfirmationDialog(context);
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
    );
  }
  Future<void> _showAddProgrammeConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Add new Programme'),
          content: const Text('Are you sure you want to add new Programme?'),
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
