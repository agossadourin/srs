import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srs/screens/principal/principal.dart';
import 'package:srs/screens/splash_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RxBool isFirstTime = true.obs;
  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    if (isFirstTime) {
      //no possibility to go bak to splash screen

      Get.off(() => const OnboardingScreen());
      await prefs.setBool('first_time', false);
    } else {
      Get.off(() => Principal());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //go to onboarding screen if first time, else go to register screen
      checkFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00DBB7),
              Color(0xFF081715),
            ],
          ),
        ),
        // other properties of the container
        child: Center(
          //logo here
          child: Image.asset(
              'assets/images/logo.png'), // replace with your logo path
        ));
  }
}
