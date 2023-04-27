import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';
import 'images_path.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _hasCallSupport = false;
  Future<void>? launched;
  final String _phone = '0208 524 4516';

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
    return PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: Get.height * 0.08,
            color: primaryColor,
            child: Center(
              child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(Images.logo))),
                  ),
                  title: const Text(
                    maxLines: 1,
                    'The Foot And Ankle Centre',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Container(
                    width: Get.width * 0.08,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Center(
                      child: InkWell(
                        onTap: _hasCallSupport
                            ? () => setState(() {
                                  launched = _makePhoneCall(_phone);
                                })
                            : null,
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ));
  }
}
