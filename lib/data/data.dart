
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../config/config.dart';
import '../model/programmes_model.dart';
import '../model/courses_model.dart';
import '../model/statistics_model.dart';

final List<Programmes> programme = [
  Programmes(
      text: "KNEC",
      lessons: "35 Lessons",
      imageUrl: "assets/images/pic/img1.png",
      percent: 75,
      backImage: "assets/images/box/box1.png",
      color: kDarkBlue),
  Programmes(
      text: "ICP",
      lessons: "30 Lessons",
      imageUrl: "assets/images/pic/img2.png",
      percent: 50,
      backImage: "assets/images/box/box2.png",
      color: kOrange),
  Programmes(
      text: "KASNEB",
      lessons: "20 Lessons",
      imageUrl: "assets/images/pic/img3.png",
      percent: 25,
      backImage: "assets/images/box/box3.png",
      color: kGreen),
  Programmes(
      text: "Open Programs",
      lessons: "40 Lessons",
      imageUrl: "assets/images/pic/img4.png",
      percent: 75,
      backImage: "assets/images/box/box4.png",
      color: kYellow),
  Programmes(
      text: "CBET",
      lessons: "4 Lessons",
      imageUrl: "assets/images/pic/img3.png",
      percent: 60,
      backImage: "assets/images/box/box2.png",
      color: kDarkBlue)
];

final List<Course> course = [
  Course(
    heading: "ELT",
    subHeading: "English Language Teaching",
    color: kLightBlue,
    icon: const Icon(
      Icons.menu_book_outlined,
      color: kDarkBlue,
    ),
  ),
  Course(
    heading: "ATC",
    subHeading: "Accounting Technician Course ",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      TernavIcons.lightOutline.hedphon,
      color: kGreen,
    ),
  ),
  Course(
    heading: "MMT",
    subHeading: "Master of Manufacturing Technology ",
    color: const Color(0xffF9F0D3),
    icon: Icon(TernavIcons.lightOutline.volume_low, color: kYellow),
  ),
  Course(
    heading: "DAE",
    subHeading: "Diploma of Associate Engineering",
    color: const Color(0xffF9E5D2),
    icon: Icon(
      TernavIcons.lightOutline.edit,
      color: kOrange,
    ),
  ),
  Course(
    heading: "DEE",
    subHeading: "Diploma Electrical Engineering",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      TernavIcons.lightOutline.hedphon,
      color: kGreen,
    ),
  ),

];

final List<Statistics> statistics = [
  Statistics(
    title: "Total \nstudents",
    number: "250",
  ),
  Statistics(
    title: "Employed",
    number: "100",
  ),
  Statistics(
    title: "Transition to \nother schools",
    number: "2",
  ),
  Statistics(
    title: "Courses \nOffered",
    number: "05",
  )
];
