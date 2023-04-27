import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:foot_ankle/common/primary_button.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import '../../common/textfield.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController enquiry = TextEditingController();
  final _key = GlobalKey<FormState>();
  sendEmail(
      String subject, String recipientemail, String body, String number) async {
    // final Email email = Email(
    //   subject: subject,
    //   recipients: [recipientemail],
    //   body: body,
    //   isHTML: false,
    // );
    // await FlutterEmailSender.send(email);
  }
  // String? fullNameValue;
  // String? phone;
  // String? email;
  // String? enquiry;

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  void dispose() {
    isShow = false;
    super.dispose();
  }

  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 10),
          child: Form(
            key: _key,
            child: Column(children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                'Contact',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              isShow
                  ? Container(
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: notifiyColor)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: notifiyColor,
                            size: 25,
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          const Expanded(
                            child: Text(
                              'Thank you. We will be in touch soon',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: notifiyColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              CustomTextField(
                controller: name,
                labelText: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomTextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: number,
                labelText: 'Telephone Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: email,
                labelText: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomTextField(
                maxLines: 5,
                controller: enquiry,
                labelText: 'Enquiry',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              CustomButton(
                text: 'Send',
                onPressed: () {
                  isShow = !isShow;
                  if (_key.currentState!.validate()) {
                    log(email.toString());
                    log(number.toString());
                    sendEmail(name.text, email.text, enquiry.text, number.text);
                  }

                  // setData(
                  //     fullNameValue: nameController.text,
                  //     phone: numberController.text,
                  //     email: emailController.text,
                  //     enquiry: enquiryController.text);
                  // getData();
                  // log(fullNameValue.toString());
                  // log(phone.toString());
                  // log(email.toString());
                  // log(enquiry.toString());
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  // Future<void> setData({fullNameValue, phone, email, enquiry}) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString('fullName', fullNameValue);
  //   pref.setString('phone', phone);
  //   pref.setString('email', email);
  //   pref.setString('enquiry', enquiry);
  //   log('success'.toString());
  // }

  // void getData() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   fullNameValue = pref.getString('fullName');
  //   phone = pref.getString('phone');
  //   email = pref.getString('email');
  //   enquiry = pref.getString('fullName');
  //   setState(() {});
  // }
}
