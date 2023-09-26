import 'package:flutter/material.dart';

import '../../model/student_alumni.dart';
import 'components/side_menu.dart';

class AlumniStudent extends StatefulWidget {
  const AlumniStudent({Key? key}) : super(key: key);

  @override
  _AlumniStudentState createState() => _AlumniStudentState();
}

class _AlumniStudentState extends State<AlumniStudent> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ... App bar and title ...

              const SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  const Text(
                    "Students/Alumni",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Add Student"),
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
                  return ListTile(
                    title: Text(student.name),
                    subtitle: Text("Program: ${student.program}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle editing the student here.
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle deleting the student here.
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
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
