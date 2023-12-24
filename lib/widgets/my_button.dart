import 'package:flutter/material.dart';

import 'package:online_bazar/consts/consts.dart';

Widget MyButton(String ?title, bgcolor, textcolor, onpress) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor, padding: const EdgeInsets.all(12)),
      onPressed: onpress,
      child: title!.text.color(textcolor).fontFamily(bold).make());
}
