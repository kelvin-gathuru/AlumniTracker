import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../config/config.dart';
import 'dart:io';

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
            if (isPassword) {
              if (value!.length < 8) {
                return 'Password must be at least 8 characters long';
              }

              bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
              bool hasLowercase = value.contains(RegExp(r'[a-z]'));
              bool hasSpecialChar = value.contains(RegExp(r'[@$!%*?&,.+=)(|/]'));

              if (!hasUppercase || !hasLowercase || !hasSpecialChar) {
                String missingChars = '';
                if (!hasUppercase) missingChars += 'uppercase, ';
                if (!hasLowercase) missingChars += 'lowercase, ';
                if (!hasSpecialChar) missingChars += 'special character, ';

                missingChars = missingChars.substring(0, missingChars.length - 2); // Remove the trailing comma and space
                return 'Password must have a $missingChars';
              }
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


Widget buildFeedbackTextArea(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 5, // Allow multiple lines for feedback
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Feedback is required';
        }
        return null; // Return null for other cases (no error message)
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
      ),
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
class AccessDeniedOverlay extends StatelessWidget {
  const AccessDeniedOverlay({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),
            const Text(
              'Access Denied!',
              style: TextStyle(
                color: kOrange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'You do not have permission to access this page.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your navigation logic here to go back
                Navigator.of(context).pop();
              },
              child: const Text(
                'Go Back',
                style: TextStyle(
                  color: kOrange, // Change to your desired color
                  fontSize: 18,    // Change to your desired font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
