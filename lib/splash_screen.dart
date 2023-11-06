import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/home_page.dart';

import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
   
  Future.delayed(Duration(seconds: 3,),(){
Get.to(()=>const LoginScreen());

  });

  }

  @override
  void initState() {
    changeScreen();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 89, 31),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center
          ,children: [
          Text(
            "Online Bazar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "version: 1.0.0",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 200,),
          Text("credit:@sova_kushwaha"),

        ]),
      ),
    );
  }
}
