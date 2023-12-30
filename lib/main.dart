import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/auth/login_screen.dart';
import 'package:online_bazar/home_screen/home_screen.dart';
import 'package:online_bazar/splash_screen.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),);
  }
}