import 'package:flutter/material.dart';
import 'package:foot_ankle/view/splash/dashboard/main_dashboard.dart';
import 'package:foot_ankle/common/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 02), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboarMainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.splash), fit: BoxFit.cover)),
    ));
  }
}
