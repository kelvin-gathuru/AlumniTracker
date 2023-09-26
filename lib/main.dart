import 'package:alumni_tracker/screens/dashboard/alumni_student.dart';
import 'package:alumni_tracker/screens/dashboard/dashboard.dart';
import 'package:alumni_tracker/screens/forgot_password.dart';
import 'package:alumni_tracker/screens/forgot_password_otp.dart';
import 'package:alumni_tracker/screens/login_signup.dart';
import 'package:alumni_tracker/screens/reset_password.dart';
import 'package:alumni_tracker/screens/verify_account_otp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alumni tracker",
      theme: ThemeData(
        fontFamily: 'Poppins', // Set Poppins as the default font
        // Add other theme configurations here
      ),
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => const LoginSignupScreen(),
        'forgot_password': (context) => const ForgotPassword(),
        'forgot_password_otp':(context) =>const ForgotPasswordOtp(),
        'reset_password':(context) =>const ResetPassword(),
        'verify_account_otp':(context) =>const VerifyAccountOtp(),
        'dashboard':(context) =>const Dashboard(),
        'alumni_student':(context) => AlumniStudent(),
      },
      onGenerateRoute: (settings) {
        // Handle any additional route generation logic here if needed
        return null; // Return null to indicate that the route is not found
      }
    );
  }
}
