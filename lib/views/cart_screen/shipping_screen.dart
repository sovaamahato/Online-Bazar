import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/firebase_consts.dart';
import 'package:online_bazar/controllers/cart_controller.dart';
import 'package:online_bazar/views/cart_screen/payment_method.dart';
import 'package:online_bazar/widgets/custom_textfield.dart';
import 'package:online_bazar/widgets/my_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: "Shipping Information"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make()),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: MyButton("Proceeed", redColor, whiteColor, () {
          if (controller.addressController.text.length > 10) {
            Get.to(() => const PaymentMethods());
          } else {
            VxToast.show(context, msg: "Please fill the form");
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CustomTextField(
              hint: "Address",
              obScure: false,
              title: "Address",
              controller: controller.addressController),
          CustomTextField(
              hint: "city",
              obScure: false,
              title: "city",
              controller: controller.cityController),
          CustomTextField(
              hint: "State",
              obScure: false,
              title: "State",
              controller: controller.stateController),
          CustomTextField(
              hint: "Postal Code",
              obScure: false,
              title: "Postal Code",
              controller: controller.postalcodeController),
          CustomTextField(
              hint: "Phone",
              obScure: false,
              title: "Phone",
              controller: controller.phoneController),
        ]),
      ),
    );
  }
}
