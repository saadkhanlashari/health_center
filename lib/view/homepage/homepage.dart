import 'package:flutter/material.dart';
import 'package:foot_ankle/view/patient_information/patient_information.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import '../../common/custom_image_container.dart';
import '../../common/images_path.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
            .copyWith(bottom: 10),
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          const Text(
            'Welcome to our app',
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            'What you might find useful as\n a new or existing patient',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          CustomCategory(
            title: 'Your Questions, Answered',
            subtitle: 'Frequently Asked questions',
            image: Image.asset(
              Images.foot,
              height: Get.height * 0.1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          CustomCategory(
            title: 'No insurance, no worries',
            subtitle: 'Self Pay',
            image: Image.asset(
              Images.person,
              height: Get.height * 0.1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          CustomCategory(
            title: 'We have got you covered',
            subtitle: 'Insured Patients',
            image: Image.asset(
              Images.women,
              height: Get.height * 0.12,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PatientInfoScreen()));
            },
          ),
        ]),
      ),
    ));
  }
}





// sendEmail(
//     String subject,
//     String body,
//     String recipientemail,
//     String enquiry,
//   ) async {
//     final Email email = Email(
//       body: body,
//       subject: subject,
//       recipients: ['msharjeeljam@gmail.com'],
//       isHTML: false,
//     );
//     await FlutterEmailSender.send(email);
//   }