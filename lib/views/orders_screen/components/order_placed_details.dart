import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

Widget orderPlacedDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //col 1
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title1".text.fontFamily(semibold).make(),
            "$d1".text.color(redColor).fontFamily(semibold).make(),
          ],
        ),
        //col2
        SizedBox(
          width: 135,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title2".text.fontFamily(semibold).make(),
              "$d2".text.fontFamily(semibold).make(),
            ],
          ),
        )
      ],
    ),
  );
}
