import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/controllers/cart_controller.dart';

import '../../widgets/my_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: MyButton("Place Order", redColor, whiteColor, () {
          controller.placeMyOrder(
              orderPaymentMethod: paymentMethods[controller.paymentIndex.value],
              totalAmount: controller.totalP.value);
        }),
      ),
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: "Choose Payment method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
            children: List.generate(paymentMethodsImg.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: controller.paymentIndex.value == index
                              ? redColor
                              : Colors.transparent,
                          width: 1)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        paymentMethodsImg[index],
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                        colorBlendMode: controller.paymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.paymentIndex.value == index
                            ? Colors.black.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      controller.paymentIndex.value == index
                          ? Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  activeColor: Colors.green,
                                  value: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  onChanged: (value) {}),
                            )
                          : Container(),
                      Positioned(
                          bottom: 0,
                          right: 10,
                          child: paymentMethods[index]
                              .text
                              .white
                              .fontFamily(semibold)
                              .size(16)
                              .make())
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
