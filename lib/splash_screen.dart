import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/home_page.dart';
import 'package:online_bazar/widgets/app_logo_widget.dart';

import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
   
  Future.delayed(Duration(seconds: 3,),(){
Get.to(()=> LoginScreen());

  });

  }

  @override
  void initState() {
    changeScreen();
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 89, 31),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center
          ,children: [
            Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg,width: 300,),),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
         const Text(
            "Online Bazar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "version: 1.0.0",
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          const Text("credit:@sova_kushwaha"),

        ]),
      ),
    );
  }
}
