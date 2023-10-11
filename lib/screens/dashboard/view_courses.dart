import 'package:alumni_tracker/config/config.dart';
import 'package:alumni_tracker/screens/dashboard/_courseAdd.dart';
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
                  Row(
                    children: [
                      const Icon(
                        Icons.school,
                        color: kDarkBlue,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: " COURSES",
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddNewCourse();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kDarkBlue, // Change the button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      "NEW COURSE",
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
                itemCount: course.length,
                itemBuilder: (context, index) {
                  final courses = course[index];
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
