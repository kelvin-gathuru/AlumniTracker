import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../data/data.dart';

class ProgrammeGrid extends StatelessWidget {
  const ProgrammeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: course.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(programme[index].backImage), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        programme[index].text,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        programme[index].lessons,
                        style: const TextStyle(color: Colors.white),
                      ),
                      CircularPercentIndicator(
                        radius: 30,
                        lineWidth: 8,
                        animation: true,
                        animationDuration: 1500,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: programme[index].percent / 100,
                        progressColor: Colors.white,
                        center: Text(
                          "${programme[index].percent}%",
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        programme[index].imageUrl,
                        height: 110,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
