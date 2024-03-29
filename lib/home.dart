import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:online_bazar/views/cart_screen/cart_screen.dart';
import 'package:online_bazar/views/category_screen/category_screen.dart';
import 'package:online_bazar/controllers/home_controllers.dart';
import 'package:online_bazar/views/home_screen/home_screen.dart';
import 'package:online_bazar/views/profile_screen/profile.screen.dart';
import 'package:online_bazar/widgets/exit_dialog.dart';
import 'consts/consts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //controller for home page body
    var controller = Get.put(HomeController());

    //body of home pages---
    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
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
          label: "Categories"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: "Cart"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: "Profile"),
    ];
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return exitDialog(context);
            });
      },
      child: Scaffold(
        body: Obx(
          () => Expanded(
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
      ),
    );
  }
}
