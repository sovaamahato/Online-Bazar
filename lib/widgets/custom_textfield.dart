import "package:flutter/material.dart";
import 'package:online_bazar/consts/consts.dart';

Widget CustomTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(redColor).size(16).make(),
      5.heightBox,
      TextFormField(
        //controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(color: textfieldGrey, fontFamily: semibold),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redColor))),
      ),
      5.heightBox,
    ],
  );
}
