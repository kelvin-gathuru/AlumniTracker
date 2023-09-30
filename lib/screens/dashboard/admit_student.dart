import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/builders.dart';
import 'components/app_bar.dart';

class AdmitStudentPage extends StatefulWidget {
  const AdmitStudentPage({super.key});

  @override
  _AdmitStudentPageState createState() => _AdmitStudentPageState();
}

class _AdmitStudentPageState extends State<AdmitStudentPage> {
  final TextEditingController _passwordController = TextEditingController();
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  int _currentStep = 0;
  final AutovalidateMode _autovalidateMode =
      AutovalidateMode.disabled; // Initially disabled
  // Define controllers for text fields
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController passportPhotoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController alternativeMobileNumberController =
      TextEditingController();
  TextEditingController parentFirstNameController = TextEditingController();
  TextEditingController parentMiddleNameController = TextEditingController();
  TextEditingController parentLastNameController = TextEditingController();
  TextEditingController parentContactController = TextEditingController();
  TextEditingController modeOfStudyController = TextEditingController();
  TextEditingController cohortController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Student Admission",
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          final form = _formKeys[_currentStep].currentState;
          if (form != null && form.validate()) {
            if (_currentStep < 3) {
              setState(() {
                _currentStep++;
              });
            }
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: [
          Step(
            title: const Text("Profile"),
            content: Form(
              key: _formKeys[0],
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  buildPassportPhotoField(),
                  buildTextField(CupertinoIcons.lock, "Registration Number",
                      false, false, registrationNumberController),
                  buildTextField(CupertinoIcons.person, "First Name", false,
                      false, firstNameController),
                  buildTextField(CupertinoIcons.person, "Middle Name", false,
                      false, middleNameController),
                  buildTextField(CupertinoIcons.person, "Last Name", false,
                      false, lastNameController),
                  buildTextField(CupertinoIcons.lock, "ID Number", false, false,
                      idNumberController),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Contacts"),
            content: Form(
              key: _formKeys[1],
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  buildTextField(CupertinoIcons.phone, "Mobile Number", false,
                      false, mobileNumberController),
                  buildTextField(CupertinoIcons.mail, "Email Address", false,
                      true, emailAddressController),
                  buildTextField(
                      CupertinoIcons.phone,
                      "Alternative Mobile Number",
                      false,
                      false,
                      alternativeMobileNumberController),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Parents"),
            content: Form(
              key: _formKeys[2],
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  buildTextField(CupertinoIcons.person, "Parent First Name",
                      false, false, parentFirstNameController),
                  buildTextField(CupertinoIcons.person, "Parent Middle Name",
                      false, false, parentMiddleNameController),
                  buildTextField(CupertinoIcons.person, "Parent Last Name",
                      false, false, parentLastNameController),
                  buildTextField(CupertinoIcons.phone, "Parent Contact", false,
                      false, parentContactController),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Academics"),
            content: Column(
              children: [
                buildTextField(CupertinoIcons.person, "Mode of Study", false,
                    false, modeOfStudyController),
                buildTextField(CupertinoIcons.person, "Cohort", false, false,
                    cohortController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
