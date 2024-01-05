//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/splash_screen.dart';
//import 'package:online_bazar/views/home_screen/home_screen.dart';
//import 'package:online_bazar/splash_screen.dart';

//import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDhv5E9Go1ZlCiRziPfb73wWUnsScKjTZI",
      appId: "1:114827691684:android:4f85ecb5a5e2ae39878831",
      messagingSenderId: "114827691684",
      projectId: "online-bazar-b5ca8",
    ),
  );

  // Configure Firebase App Check
  //await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: darkFontGrey))),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
