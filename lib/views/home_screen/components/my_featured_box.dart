import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

Widget myFeaturedbox({String ? title, icon}){
  return Row(children: [
    Image.asset(icon,height: 60,fit: BoxFit.fill,),
    5.widthBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make()
  ]).box.roundedSM.outerShadowSm.width(200).padding(EdgeInsets.all(4)).margin(EdgeInsets.symmetric(horizontal: 5)).make();
}