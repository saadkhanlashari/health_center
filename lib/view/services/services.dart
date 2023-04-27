// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/colors.dart';
import '../../common/custom_services.dart';
import '../../common/custom_widgets.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool chiropody = true;
  int updatedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
            .copyWith(bottom: 10),
        child: chiropody
            ? Column(children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                const Text(
                  'For Your Feet',
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
                    Text(
                      'Show Physiotherapy services',
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
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
                        InkWell(
                          onTap: () {
                            chiropody = !chiropody;
                            log(chiropody.toString());
                            setState(() {});
                          },
                          child: const CustomServices(
                            title: 'Chiropody & Podiatry',
                          ),
                        ),
                        const CustomServices(
                          title: 'Biomechanics',
                        ),
                        const CustomServices(
                          title: 'Sports Injuries & Foot Pain',
                        ),
                        const CustomServices(
                          title: 'Foot & Ankle Surgery',
                        ),
                        const CustomServices(
                          title: 'Laser Treatment for Fungal Infection',
                        ),
                        const CustomServices(
                          title: 'Cosmatic Foot Sergery',
                        ),
                        const CustomServices(
                          title: 'Foot Botox',
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            : const ChiropodyWidget(),
      ),
    );
  }
}
