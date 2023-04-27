// Chiropody & Podiatry......
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/booking/booking.dart';
import 'colors.dart';
import 'custom_image_container.dart';
import 'custom_services.dart';
import 'images_path.dart';

class ChiropodyWidget extends StatefulWidget {
  const ChiropodyWidget({super.key});

  @override
  State<ChiropodyWidget> createState() => _ChiropodyWidgetState();
}

class _ChiropodyWidgetState extends State<ChiropodyWidget> {
  bool isShown = true;
  @override
  Widget build(BuildContext context) {
    return isShown
        ? Column(children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text(
              'Physioterapy',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.pushReplacementNamed(context, MaterialPageRoute(builder: (context) {
                  //     return ServicesScreen();
                  //   },));
                  // },
                  child: Text(
                    'Show chiropody and podiatry services',
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
            Expanded(
              child: SizedBox(
                height: Get.height,
                // color: Colors.red,
                child: ListView(
                  children: [
                    const CustomServices(
                      title: 'Diagnostic Ultrasound',
                    ),
                    const CustomServices(
                      title: 'Trigger Point Dry Needling',
                    ),
                    InkWell(
                      onTap: () {
                        isShown = !isShown;
                        log(isShown.toString());
                        setState(() {});
                      },
                      child: const CustomServices(
                        title: 'Physiotherapy',
                      ),
                    ),
                    const CustomServices(
                      title: 'Extracorporeal Shockwave Therapy',
                    ),
                  ],
                ),
              ),
            )
          ])
        : const PhysiotheraphyInfo();
  }
}

// PhysiotherapyWidget....
class PhysiotheraphyInfo extends StatelessWidget {
  const PhysiotheraphyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        const Text(
          'Physiotherapy',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        SizedBox(
          height: Get.height * 0.01,
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
              // onTap: () {
              //   Navigator.pop(context);
              // },
              child: Text(
                'Back to all physiotherapy services',
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
        CustomCategory(
          title: 'Diagnostic Ultrasound',
          subtitle: 'Make an Appointment',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookingScreen()));
          },
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Stack(
          children: [
            Container(
              height: Get.height * 0.15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(Images.treat))),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(Images.logo))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        const Text(
          'Diagnostic Ultrasound, also called sonography or Diagnostic medical sonography a branch of diagnostic medical imaging, is the use of imaging by medical ultrasound for medical diagnosis. DMS uses non-ionizing ultrasound to produce 2D and 3D images of the body.',
          textAlign: TextAlign.start,
          style: TextStyle(
            // color: Theme.of(context).cardColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
