import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/views/category_screen/categories_details.dart';

Widget myFeaturedbox({String? title, icon}) {
  return Row(children: [
    Image.asset(
      icon,
      height: 60,
      fit: BoxFit.fill,
    ),
    5.widthBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make()
  ])
      .box
      .roundedSM
      .outerShadowSm
      .width(200)
      .padding(const EdgeInsets.all(4))
      .margin(const EdgeInsets.symmetric(horizontal: 5))
      .make()
      .onTap(() {
    Get.to(() => CategoriesDetails(title: title));
  });
}
