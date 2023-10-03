import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/material.dart';

import '../../model/student_model.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class StudentCentre extends StatefulWidget {
  const StudentCentre({Key? key}) : super(key: key);

  @override
  _StudentCentreState createState() => _StudentCentreState();
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
                          text: "STUDENTS",
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
                              value: "discharge",
                              child: ListTile(
                                leading: Icon(Icons.exit_to_app),
                                title: Text("Discharge"),
                              ),
                            ),
                          ];
                        },
                        onSelected: (String? value) {
                          if (value == "profile") {
                            // Handle profile action
                          } else if (value == "contacts") {
                            // Handle contacts action
                          } else if (value == "parents") {
                            // Handle parents action
                          } else if (value == "academics") {
                            // Handle academics action
                          } else if (value == "discharge") {
                            // Handle discharge action
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