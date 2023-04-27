import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:foot_ankle/common/primary_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../common/colors.dart';
import '../../common/textfield.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late String setTime, setDate;

  late String hour, minute, time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _key = GlobalKey<FormState>();
  String dropdownvalue = 'Chingford';

  // List of items in our dropdown menu
  var items = [
    'Chingford',
    'Wanstead',
    'Westcliff-on-Sea',
  ];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       selectedTime = picked;
  //       hour = selectedTime.hour.toString();
  //       minute = selectedTime.minute.toString();
  //       time = '$hour : $minute';
  //       timeController.text = time;
  //     });
  //   }
  // }

  @override
  void dispose() {
    isShow = false;

    super.dispose();
  }

  bool isShow = false;
  DateTime _dateTime = DateTime.now();
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
              const Text(
                'Book Appointment',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
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
                              'We will call you soon to arrange an appointment',
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
                controller: nameController,
                labelText: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: numberController,
                labelText: 'Telephone Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              CustomDropDown(
                labelText: 'Preferred Clinic',
                hintText: '-Please Select-',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                    ),
                  );
                }).toList(),
                onChanged: (p0) {
                  return const SizedBox();
                },
              ),
              CustomTextField(
                //  enabled: false,
                controller: dateController,
                labelText: 'Appointment Date',
                suffixIcon: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    color: primaryColor,
                  ),
                ),
              ),
              CustomTextField(
                controller: timeController,
                labelText: 'Select Time Slot',
                suffixIcon: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, setstate) {
                            return AlertDialog(
                                title: const Text(
                                    textAlign: TextAlign.center,
                                    'Select Slot 9:Am to 6:PM'),
                                content: TimePickerSpinner(
                                  isForce2Digits: true,
                                  is24HourMode: false,
                                  spacing: 20,
                                  minutesInterval: 30,
                                  onTimeChange: (time) {
                                    setState(() {
                                      _dateTime = time;
                                    });
                                  },
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          timeController.clear();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancle')),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          timeController.text = _dateTime
                                              .toString()
                                              .split(' ')
                                              .last;
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok'))
                                ]);
                          });
                        });
                  },
                  child: const Icon(
                    Icons.punch_clock,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomButton(
                text: 'Send',
                onPressed: () {
                  isShow = !isShow;
                  if (_key.currentState!.validate()) {}
                  log(isShow.toString());
                  setState(() {});
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
