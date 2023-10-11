import 'dart:io';

import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilities/builders.dart';

class EditStudentProfile extends StatefulWidget {
  @override
  _EditStudentProfileState createState() => _EditStudentProfileState();
}

class _EditStudentProfileState extends State<EditStudentProfile> {
  List<Color>? gradientColors;
  final _editStudentProfileFormKey = GlobalKey<FormState>();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController passportPhotoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  XFile? image;

  final ImagePicker picker = ImagePicker();

//we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  // Create a custom widget for the "Passport Photo" field
  Widget buildPassportPhotoField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Passport Photo",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Palette.textColor1),
          ),
          const SizedBox(height: 8),

          CircleAvatar(
            radius: 50, // Adjust the size as needed
            backgroundColor: Colors.grey[200],
            child: image != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(50), // Make it a circle
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover, // Adjust the fit as needed
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
            )
                : const Icon(
              Icons.person, // Use your desired icon
              size: 50, // Adjust the size of the icon as needed
              color: Colors.grey, // Adjust the color of the icon as needed
            ),
          ),
        ],
      ),
    );
  }

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
                    "Edit Student Profile",
                    style: TextStyle(
                      color: Palette.activeColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _editStudentProfileFormKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            myAlert();
                          },
                          child: buildPassportPhotoField(),
                        ),
                        buildTextField(CupertinoIcons.lock, "Registration Number",
                            false, false, registrationNumberController),
                        buildTextField(
                            CupertinoIcons.person, "First Name", false, false, firstNameController),
                        buildTextField(
                            CupertinoIcons.person, "Middle Name", false, false, middleNameController),
                        buildTextField(
                            CupertinoIcons.person, "Last Name", false, false, lastNameController),
                        buildTextField(CupertinoIcons.lock, "ID Number", false, false,
                            idNumberController),

                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      if (_editStudentProfileFormKey.currentState!.validate()) {
                        _showEditStudentProfileDialog(context);
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
  Future<void> _showEditStudentProfileDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Edit Student Profile'),
          content: const Text('Are you sure you want to edit student profile?'),
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
