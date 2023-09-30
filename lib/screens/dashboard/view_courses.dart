import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class ViewCourses extends StatefulWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  _ViewCoursesState createState() => _ViewCoursesState();
}

class _ViewCoursesState extends State<ViewCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "",
        onBack: (){},
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
              // ... App bar and title ...

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.school_outlined,
                    color: Colors.grey,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Courses",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        letterSpacing: 2,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("New Course"),
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
                itemCount: course.length,
                itemBuilder: (context, index) {
                  final courses = course[index];
                  return ListTile(
                    title: Text(courses.heading),
                    subtitle: Text(courses.subHeading),
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
