import 'package:e_wast_app/ui/auth_screens/login_screens.dart';
import 'package:e_wast_app/ui/home_screen/home_screen.dart';
import 'package:e_wast_app/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/auth_screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Waste App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}