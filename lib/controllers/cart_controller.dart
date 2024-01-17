import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/firebase_consts.dart';
import 'package:online_bazar/controllers/home_controllers.dart';

class CartController extends GetxController {
  //text controller for shipping details
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalcodeController = TextEditingController();
  var phoneController = TextEditingController();
  var totalP = 0.obs;
  var paymentIndex = 0.obs;
  late dynamic productSnapshot;
  var products = [];
  var placingorder = false.obs;

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingorder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "23398127",
      "order_date": FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': "Home delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'total_amount': totalAmount,
      'order_delivered': false,
      'order_confirmed': false,
      'order_on_delivery': false,
      'orders': FieldValue.arrayUnion(products)
    });
    placingorder(false);
  }

  getProductDetails() {
    products.cast();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'qty': productSnapshot[i]['qty'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'tprice': productSnapshot[i]['tprice'],
        'title': productSnapshot[i]['title'],
      });
    }
    //print(products);
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollectio).doc(productSnapshot[i].id).delete();
    }
  }
}
