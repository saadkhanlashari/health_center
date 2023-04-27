import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class CustomCategory extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? subtitle;
  final Image? image;
  const CustomCategory({
    super.key,
    this.title,
    this.subtitle,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), gradient: gradinatColor),
          child: Padding(
            padding: EdgeInsets.only(left: Get.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  // 'Your Questions, Answered',
                  style: const TextStyle(color: Colors.white, fontSize: 19),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        subtitle!,
                        // 'Frequently Asked questions',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: image,
        ),
      ],
    );
  }
}
