import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srs/screens/splash_screen/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00DBB7),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
