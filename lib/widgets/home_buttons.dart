import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

Widget homeButtons(height, width, icon, String title,onPress){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center
    ,children: [
    //icons
    Image.asset(icon,height: 26,),
    10.heightBox,
    //title
    title!.text.fontFamily(semibold).color(darkFontGrey).make(),
  ],).box.rounded.white.size(width, height).shadowSm.make();
}
