
import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../widgets/activity_header.dart';
import '../../widgets/bar_chart.dart';
import '../../widgets/programme_grid.dart';
import '../../widgets/course_grid.dart';
import '../../widgets/course_header.dart';
import '../../widgets/statistics_grid.dart';
import 'components/app_bar.dart';
import 'components/chart_container.dart';
import 'components/side_menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
              RichText(
                text: const TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: kDarkBlue, fontSize: 20),
                  children: [
                    TextSpan(
                      text: "USER",
                      style: TextStyle(
                          color: kDarkBlue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", welcome back!",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Programmes",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'view_programmes');
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: kDarkBlue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CourseGrid(),
              const SizedBox(
                height: 20,
              ),
              const CourseHeader(),
              const SizedBox(
                height: 15,
              ),
              const PlaningGrid(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Statistics",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const StatisticsGrid(),
              const SizedBox(
                height: 15,
              ),
              // const ActivityHeader(),
              // const ChartContainer(chart: BarChartContent())
            ],
          ),
        ),
      ),
    );
  }
}
