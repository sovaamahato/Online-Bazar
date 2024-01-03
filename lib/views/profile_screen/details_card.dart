import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

Widget detailsCard(double width, String count, String title){
  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    count.text.size(14).fontFamily(semibold).make(),
                    title
                        .text
                        .size(8)
                        .fontFamily(semibold)
                        .make(),
                  ],
                )
                    .box
                    .white
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .width(width).height(60)
                    .roundedSM
                    .make();
}