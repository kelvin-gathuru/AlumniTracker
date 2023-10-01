import 'package:alumni_tracker/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

import '../../utilities/builders.dart';
import 'components/app_bar.dart';
import 'components/side_menu.dart';

class FaqsAndFeedbackPage extends StatelessWidget {
  const FaqsAndFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "FAQS AND FEEDBACK",
      ),
      drawer: const SideMenu(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'FAQs (Frequently Asked Questions)',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: kDarkBlue
              ),
            ),
            SizedBox(height: 16.0),
            FaqItem(
              question: 'Why are certain pages locked?',
              answer: 'This is because of your role. There are several users types each with their privileges.',
            ),
            FaqItem(
              question: 'What are these user types?',
              answer: 'The user types in the system include:\n'
                  '1. Industrial Coordination Officer\n'
                  '2. Trainer\n'
                  '3. Alumni Officer\n'
                  '4. IT Staff\n\n'
                  'Each user type has specific roles and privileges within the system.',
            ),
            FaqItem(
              question: 'Industrial Coordination Officer Roles',
              answer: '1. The ability to enter and maintain the data about student’s placement directly.\n'
                  '2. The ability to access areas of the site through a password protection scheme.',
            ),
            FaqItem(
              question: 'Trainers Roles',
              answer: '1. The ability to enter feedback appraisal on industry visits of students in the system.',
            ),
            FaqItem(
              question: 'Alumni Officer Requirements',
              answer: '1. The responsibility for the registration of the alumni and the entry and update of data.\n'
                  '2. The ability to generate timely reports from the system.',
            ),
            FaqItem(
              question: 'IT Staff Requirements',
              answer: '1. The responsibility for implementing the new module and maintaining it.\n'
            ),
            // Add more FAQ items here

            SizedBox(height: 24.0),

            Text(
              'FEEDBACK',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: kDarkBlue
              ),
            ),
            SizedBox(height: 16.0),
            FeedbackForm(),
          ],

        ),

      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController feedbackController = TextEditingController();
  String feedback = '';
  double rating = 1.0;
  bool recommend = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFeedbackTextArea(
            feedbackController),
        const SizedBox(height: 16.0),
        const Text('Rate your experience:'),
        EmojiFeedback(
          animDuration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn,
          inactiveElementScale: .5,
          onChanged: (value) {
            print(value);
          },
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            const Text('Would you recommend our app to others?'),
            Switch(
              value: recommend,
              onChanged: (newValue) {
                setState(() {
                  recommend = newValue;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Implement feedback submission logic here
            print('Feedback: $feedback');
            print('Rating: $rating');
            print('Recommend: $recommend');
          },
          child: const Text('Submit Feedback'),
        ),
      ],
    );
  }
}
