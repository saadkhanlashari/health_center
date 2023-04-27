import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class CustomServices extends StatelessWidget {
  final String title;
  const CustomServices({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: Get.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: primaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // 'Chiropody & Podiatry',
                style: const TextStyle(color: primaryColor, fontSize: 15),
              ),
            ),
            Container(
              width: Get.width * 0.06,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: primaryColor)),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: primaryColor,
                  size: 20,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
