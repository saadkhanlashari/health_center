import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/colors.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
            .copyWith(bottom: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text(
              'Clinic Locations',
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
                Container(
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: primaryColor)),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: primaryColor,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                const Text(
                  'Make an appointment',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Clinics(
              clinicName: 'Chingford',
              clinicAddress:
                  'Station House Medical Centre66 Station RoadNorth ChingfordLondon, E4 7BA',
              clinicPhone: '0208 524 4516',
            ),
            const Clinics(
              clinicName: 'Wanstead',
              clinicAddress: 'Target Fit15 High StreetWanstead, LondonE11 2AA',
              clinicPhone: '0208 524 4951',
            ),
            const Clinics(
              clinicName: 'Westcliff-on-Sea',
              clinicAddress:
                  '51 Milton RoadWestcliff-on-SeaSouthend-on-SeaSS0 7JP',
              clinicPhone: '01702 337311',
            )
          ]),
        ),
      ),
    );
  }
}

class Clinics extends StatefulWidget {
  const Clinics({
    super.key,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicPhone,
  });
  final String clinicName;
  final String clinicAddress;
  final String clinicPhone;

  @override
  State<Clinics> createState() => _ClinicsState();
}

class _ClinicsState extends State<Clinics> {
  bool _hasCallSupport = false;
  Future<void>? launched;
  // final String _phone = //clinicPhone;
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: primaryColor)),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          widget.clinicName,
          style: const TextStyle(color: primaryColor, fontSize: 15),
        ),
        children: [
          ListTile(
            leading: const Icon(
              Icons.location_on,
              color: primaryColor,
            ),
            title: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              widget.clinicAddress,
              style: const TextStyle(fontSize: 15),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                onTap: () => MapsLauncher.launchQuery(widget.clinicAddress),
                child: const Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Click here to open in map',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: primaryColor,
                      fontSize: 15),
                ),
              ),
            ),
          ),
          ListTile(
              leading: Container(
                width: Get.width * 0.06,
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: primaryColor)),
                child: const Center(
                  child: Icon(
                    Icons.phone,
                    color: primaryColor,
                    size: 15,
                  ),
                ),
              ),
              title: InkWell(
                onTap: _hasCallSupport
                    ? () => setState(() {
                          launched = _makePhoneCall(widget.clinicPhone);
                        })
                    : null,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.clinicPhone,
                  style: const TextStyle(color: primaryColor, fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}
