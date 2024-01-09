import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/widgets/my_button.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).color(darkFontGrey).size(18).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?"
            .text
            .size(16)
            .color(darkFontGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton("yes", redColor, whiteColor, () {
              SystemNavigator.pop();
            }),
            MyButton("No", redColor, whiteColor, () {
              Navigator.pop(context);
            }),
          ],
        )
      ],
    ).box.color(lightGrey).roundedSM.padding(const EdgeInsets.all(12)).make(),
  );
}
