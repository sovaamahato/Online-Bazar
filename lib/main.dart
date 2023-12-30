import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/views/auth/login_screen.dart';
import 'package:online_bazar/views/home_screen/home_screen.dart';
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