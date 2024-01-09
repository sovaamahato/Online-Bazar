import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

Widget senderBubble() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 9),
    decoration: const BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
    child: Column(children: [
      "Message.here....".text.size(16).white.make(),
      10.heightBox,
      "11:11 pm".text.color(whiteColor.withOpacity(0.5)).make(),
    ]),
  );
}
