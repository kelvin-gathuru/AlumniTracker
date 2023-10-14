import 'package:alumni_tracker/screens/dashboard/admit_student.dart';
import 'package:alumni_tracker/screens/dashboard/alumni_centre.dart';
import 'package:alumni_tracker/screens/dashboard/faqs_and_feedback.dart';
import 'package:alumni_tracker/screens/dashboard/student_centre.dart';
import 'package:alumni_tracker/screens/dashboard/change_password.dart';
import 'package:alumni_tracker/screens/dashboard/dashboard.dart';
import 'package:alumni_tracker/screens/dashboard/edit_profile.dart';
import 'package:alumni_tracker/screens/dashboard/trainer_appraisal.dart';
import 'package:alumni_tracker/screens/dashboard/user_profile.dart';
import 'package:alumni_tracker/screens/dashboard/view_courses.dart';
import 'package:alumni_tracker/screens/dashboard/view_programmes.dart';
import 'package:alumni_tracker/screens/forgot_password.dart';
import 'package:alumni_tracker/screens/forgot_password_otp.dart';
import 'package:alumni_tracker/screens/login_signup.dart';
import 'package:alumni_tracker/screens/reset_password.dart';
import 'package:alumni_tracker/screens/verify_account_otp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
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
        'student_centre':(context) => const StudentCentre(),
        'alumni_centre':(context) => const AlumniCentre(),
        'view_programmes':(context) => const ViewProgrammes(),
        'view_courses':(context) => const ViewCourses(),
        'user_profile':(context) => const UserProfilePage(),
        'change_password':(context) => const ChangePassword(),
        'edit_profile':(context) => const EditProfile(),
        'admit_student':(context) => AdmitStudentPage(userRole: 'admin',),
        'faqs_feedback':(context) => const FaqsAndFeedbackPage(),
        'trainer_feedback':(context) => const TrainerAppraisal(),
      },
      onGenerateRoute: (settings) {
        // Handle any additional route generation logic here if needed
        return null; // Return null to indicate that the route is not found
      }
    );
  }
}
