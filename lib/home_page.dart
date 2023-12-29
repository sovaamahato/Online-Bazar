import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/controllers/home_controllers.dart';
import 'consts/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //controller for home page body
    var controller = Get.put(HomeController());

    //body of home pages---
    var navBody = [
      Container(
        color: Colors.purple,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

    //items for bottom navigation bar-----
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: "Home"),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(appname)),
      body: Obx(()=> Expanded(
          child: navBody.elementAt(controller.currentNavIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
