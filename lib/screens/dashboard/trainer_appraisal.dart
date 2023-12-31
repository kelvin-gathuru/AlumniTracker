import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/material.dart';

import '../../model/student_model.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class TrainerAppraisal extends StatefulWidget {
  const TrainerAppraisal({Key? key}) : super(key: key);

  @override
  _TrainerAppraisalState createState() => _TrainerAppraisalState();
}

class _TrainerAppraisalState extends State<TrainerAppraisal> {
  // Dummy student data
  final List<Student> students = [
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),

    // Add more dummy students as needed
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "",
        onSearch: () {
          // Handle search button press here
        },
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Adjust alignment as needed
                children: [
                  Icon(
                    Icons.message,
                    color: kDarkBlue,
                    size: 32, // Adjust icon size as needed
                  ),
                  SizedBox(width: 10), // Add spacing between icon and text
                  Text(
                    "TRAINER FEEDBACK",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      letterSpacing: 1,
                      color: kDarkBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // Display the list of students using ListView.builder
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Add border color
                        width: 1.0, // Adjust border width as needed
                      ),
                      color: kLightBlue,
                      borderRadius: BorderRadius.circular(15.0), // Add border radius
                    ),
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.messenger_outline, // Add the person icon here
                        color: Palette.textColor2, // Customize the icon color
                        size: 32, // Customize the icon size
                      ),
                      title: Text(student.name),
                      subtitle: Text("Program: ${student.program}"),
                      // Remove the PopupMenuButton
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the new appraisal action here
          // You can navigate to a new page or show a dialog to create a new appraisal.
        },
        backgroundColor: kDarkBlue, // Change the button color
        child: const Icon(
          Icons.message_rounded, // Use the appropriate icon for creating a new appraisal
          color: Colors.white,
        ),
      ),
    );
  }
}