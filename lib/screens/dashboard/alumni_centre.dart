import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/material.dart';

import '../../model/student_model.dart';
import '_editStudentAcademics.dart';
import '_editStudentContact.dart';
import '_editStudentParent.dart';
import '_editStudentProfile.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class AlumniCentre extends StatefulWidget {
  const AlumniCentre({Key? key}) : super(key: key);

  @override
  _AlumniCentreState createState() => _AlumniCentreState();
}

class _AlumniCentreState extends State<AlumniCentre> {
  // Dummy student data
  final List<Student> students = [
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),
    Student(name: 'John Doe', program: 'Computer Science', admissionYear: '2020'),
    Student(name: 'Alice Smith', program: 'Engineering', admissionYear: '2019'),

    // Add more dummy students as needed
  ];
  String _selectedFilter = 'All';
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
                          text: " ALUMNI",
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
                  DropdownButton<String>(
                    value: _selectedFilter,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedFilter = newValue!;
                        // Handle the selected filter here and perform filtering as needed.
                      });
                    },
                    items: <String>[
                      'All', // You can add more filter options if needed
                      'Employed',
                      'Advancement',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Palette.textColor2, // Change the text color
                          ),
                        ),
                      );
                    }).toList(),
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
                                value: "educationAdvancement",
                                child: ListTile(
                                  leading: Icon(Icons.school_outlined),
                                  title: Text("Education Advancement"),
                                ),
                              ),
                              const PopupMenuItem(
                                value: "employment",
                                child: ListTile(
                                  leading: Icon(Icons.add_box_outlined),
                                  title: Text("Employment"),
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
                                  return EditStudentContact(userRole: "Admin",);
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
                                  return EditStudentacademics(userRole: 'Admin');
                                },
                              );
                            }  else if (value == "placement") {
                              // Handle discharge action
                            } else if (value == "educationAdvancement") {
                              // Handle discharge action
                            } else if (value == "employment") {
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