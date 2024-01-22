import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/firebase_consts.dart';

class HomeController extends GetxController {
  var currentNavIndex = 0.obs;
  var username = '';
  var featuredList = [];
  var searchController = TextEditingController();

  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  getUsername() async {
    var n = await firestore
        .collection(userCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    username = n;
    //print(username);
  }
}
