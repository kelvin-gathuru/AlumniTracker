import 'package:flutter/material.dart';

import '../config/config.dart';

Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.iconColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
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
