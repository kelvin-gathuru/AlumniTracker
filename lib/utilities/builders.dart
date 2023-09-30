import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../config/config.dart';
import 'dart:io';

File? _selectedImage;
Widget buildRequiredTag() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.red, // Customize the tag color
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
      'Required',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}

Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
    ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: controller, // Use the class-level controller
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hintText required'; // Indicates that the field is required
            }
            if (isEmail && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
              return 'Please enter a valid email';
            }
            return null; // Return null for other cases (no error message)
          },

          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Palette.iconColor,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Palette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
          ),
        ),
      ],
    ),
  );
}



Widget buildBottomHalfContainer({
  required BuildContext context,
  required bool showShadow,
  double top = 400.0,
  List<Color>? gradientColors,
  VoidCallback? onPressed, // Add an onPressed parameter
}) {
  return AnimatedPositioned(
    duration: const Duration(milliseconds: 700),
    curve: Curves.bounceInOut,
    top: top,
    right: 0,
    left: 0,
    child: Center(
      child: GestureDetector(
        onTap: onPressed, // Assign the onPressed callback to the GestureDetector
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                )
            ],
          ),
          child: !showShadow
              ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors ??
                    [Colors.orange, Colors.red], // Default gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
              : const Center(),
        ),
      ),
    ),
  );
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
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!) // Show selected image
              : null,
          child: _selectedImage == null
              ? IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
              color: Colors.blue,
            ),
            onPressed: () async {
              final picker = ImagePicker();
              final pickedImage = await picker.pickImage(
                source: ImageSource.gallery, // You can change this to ImageSource.camera for camera access
              );

              if (pickedImage != null) {
                // Set the selected image to the state variable

              }
            },

          )
              : null,
        ),
      ],
    ),
  );
}