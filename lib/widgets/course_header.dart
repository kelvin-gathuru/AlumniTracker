import 'package:flutter/material.dart';

import '../config/config.dart';


class CourseHeader extends StatelessWidget {
  const CourseHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Text(
              "Courses ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'view_courses');
              },
              child: const Text(
                "View All",
                style: TextStyle(color: kDarkBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
