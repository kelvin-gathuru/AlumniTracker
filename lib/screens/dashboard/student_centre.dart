import 'package:alumni_tracker/config/config.dart';
import 'package:alumni_tracker/screens/dashboard/_editStudentAcademics.dart';
import 'package:alumni_tracker/screens/dashboard/_editStudentParent.dart';
import 'package:alumni_tracker/screens/dashboard/_editStudentProfile.dart';
import 'package:flutter/material.dart';

import '../../model/student_model.dart';
import '_editStudentContact.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class StudentCentre extends StatefulWidget {
  const StudentCentre({Key? key}) : super(key: key);

  @override
  _StudentCentreState createState() => _StudentCentreState();
}
Future<void> _showGraduateConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Graduation'),
        content: const Text('Are you sure the student is now an alumni?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Handle logout here
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
class _StudentCentreState extends State<StudentCentre> {
  // Dummy student data
  final List<Student> students = [
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),

    // Add more dummy students as needed
  ];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: kDarkBlue,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: " STUDENTS",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 1,
                            color: kDarkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "admit_student");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kDarkBlue, // Change the button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                      title: Text(student.name),
                      subtitle: Text("Program: ${student.program}"),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(
                              value: "profile",
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Profile"),
                              ),
                            ),
                            const PopupMenuItem(
                              value: "contacts",
                              child: ListTile(
                                leading: Icon(Icons.contacts),
                                title: Text("Contacts"),
                              ),
                            ),
                            const PopupMenuItem(
                              value: "parents",
                              child: ListTile(
                                leading: Icon(Icons.people),
                                title: Text("Parents"),
                              ),
                            ),
                            const PopupMenuItem(
                              value: "academics",
                              child: ListTile(
                                leading: Icon(Icons.school),
                                title: Text("Academics"),
                              ),
                            ),
                            const PopupMenuItem(
                              value: "placement",
                              child: ListTile(
                                leading: Icon(Icons.school),
                                title: Text("Placement"),
                              ),
                            ),
                            const PopupMenuItem(
                              value: "graduate",
                              child: ListTile(
                                leading: Icon(Icons.exit_to_app),
                                title: Text("Graduate"),
                              ),
                            ),
                          ];
                        },
                        onSelected: (String? value) {
                          if (value == "profile") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return EditStudentProfile(userRole: 'Admin',);
                              },
                            );
                          } else if (value == "contacts") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return EditStudentContact(userRole: 'Admin',);
                              },
                            );
                          } else if (value == "parents") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return EditStudentParent(userRole: 'Admin',);
                              },
                            );
                          } else if (value == "academics") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return  EditStudentacademics(userRole: 'Admin');;
                              },
                            );
                          } else if (value == "placement") {
                          // Handle academics action
                          } else if (value == "graduate") {
                            _showGraduateConfirmationDialog(context);
                          }
                        },
                      )
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}