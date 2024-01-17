import 'package:flutter/material.dart';
import 'package:online_bazar/consts/colors.dart';
import 'package:online_bazar/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ).box.border(color: color).roundedSM.padding(EdgeInsets.all(8)).make(),
    trailing: SizedBox(
      height: 100,
      width: 120,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "$title".text.color(darkFontGrey).make(),
        showDone
            ? Icon(
                Icons.done,
                color: redColor,
              )
            : Container()
      ]),
    ),
  );
}
