import 'package:flutter/material.dart';
import 'package:foot_ankle/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import '../../common/custom_image_container.dart';

class PatientInfoScreen extends StatefulWidget {
  const PatientInfoScreen({super.key});

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  'Patient Information ',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const CustomCategory(
              title: 'We have got you covered',
              subtitle: 'Insured Patients',
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              'Check your insurance policy:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
              style:
                  TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              'Get a Referral:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'It is a long established fact that a  as opposed to using, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
              style:
                  TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
            ),
          ]),
        ),
      ),
    );
  }
}
