// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foot_ankle/view/booking/booking.dart';
import 'package:foot_ankle/view/contact/contact.dart';
import 'package:foot_ankle/view/location/location.dart';
import 'package:foot_ankle/view/services/services.dart';
import 'package:foot_ankle/view/homepage/homepage.dart';
import 'package:get/get.dart';

import '../../../common/colors.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/images_path.dart';

class DashboarMainScreen extends StatefulWidget {
  const DashboarMainScreen({super.key});

  @override
  State<DashboarMainScreen> createState() => _DashboarMainScreenState();
}

class _DashboarMainScreenState extends State<DashboarMainScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      // resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: Container(
            // color: Colors.orange,
            child: currentindex == 0
                ? const HomePageScreen()
                : currentindex == 1
                    ? const ServicesScreen()
                    : currentindex == 2
                        ? const BookingScreen()
                        : currentindex == 3
                            ? const LocationScreen()
                            : const ContactScreen(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            // borderRadius: BorderRadius.circular(10),
          ),
          height: Get.height * 0.09,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex = 0;
                    });
                  },
                  child: Container(
                    height: Get.height * 0.09,
                    width: Get.width * 0.195,
                    color: currentindex == 0 ? primaryColor : Colors.black12,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            color: currentindex == 0
                                ? const Color(0xffffffff)
                                : null,
                            Images.home,
                            height: Get.height * .03,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currentindex == 0
                                  ? const Color(0xffffffff)
                                  : null,
                              fontSize: 15,
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  width: Get.width * .005,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex = 1;
                    });
                  },
                  child: Container(
                    height: Get.height * 0.09,
                    width: Get.width * 0.195,
                    color: currentindex == 1 ? primaryColor : Colors.black12,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            color: currentindex == 1
                                ? const Color(0xffffffff)
                                : null,
                            Images.services,
                            height: Get.height * .03,
                          ),
                          Text(
                            'Services',
                            style: TextStyle(
                              color: currentindex == 1
                                  ? const Color(0xffffffff)
                                  : null,
                              fontSize: 15,
                            ),
                          )
                        ]),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex = 3;
                    });
                  },
                  child: Container(
                    height: Get.height * 0.09,
                    width: Get.width * 0.195,
                    color: currentindex == 3 ? primaryColor : Colors.black12,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            color: currentindex == 3
                                ? const Color(0xffffffff)
                                : null,
                            Images.location,
                            height: Get.height * .03,
                          ),
                          Text(
                            'Location',
                            style: TextStyle(
                              color: currentindex == 3
                                  ? const Color(0xffffffff)
                                  : null,
                              fontSize: 15,
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  width: Get.width * .005,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentindex = 4;
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => const Account())));
                    });
                  },
                  child: Container(
                    height: Get.height * 0.09,
                    width: Get.width * 0.195,
                    color: currentindex == 4 ? primaryColor : Colors.black12,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            Images.contact,
                            height: Get.height * .03,
                            color: currentindex == 4
                                ? const Color(0xffffffff)
                                : null,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                              color: currentindex == 4
                                  ? const Color(0xffffffff)
                                  : null,
                              fontSize: 15,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 500),
        child: InkWell(
          onTap: () {
            setState(() {
              currentindex = 2;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: currentindex == 2 ? primaryColor : const Color(0xffffffff),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.0), // shadow direction: bottom right
                )
              ],
            ),
            padding: const EdgeInsets.only(top: 25),
            height: Get.height * 0.12,
            width: Get.width * 0.21,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    color: currentindex == 2 ? const Color(0xffffffff) : null,
                    Images.booking,
                    height: Get.height * .03,
                  ),
                  Text(
                    'Booking',
                    style: TextStyle(
                      color: currentindex == 2 ? const Color(0xffffffff) : null,
                      fontSize: 15,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
