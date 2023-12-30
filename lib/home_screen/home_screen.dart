import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/widgets/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(children: [
          //searching wala textfield-----
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: "Search anything...",
                hintStyle: TextStyle(color: textfieldGrey),
              ),
            ),
          ),
          //brand swipers -----------------------------

          VxSwiper.builder(
              aspectRatio: 16 / 9,
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  sliderList[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(EdgeInsets.symmetric(horizontal: 8))
                    .make();
              }),

          10.heightBox,
          //row----buttons wala -
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  2,
                  (index) => homeButtons(
                      context.screenHeight * 0.16,
                      context.screenWidth / 2.5,
                      index == 0 ? icTodaysDeal : icFlashDeal,
                      index == 0 ? "Todays deal" : "Flash deal",
                      () {}))),

          //brand 2nd swipers -----------------------------
          10.heightBox,
          VxSwiper.builder(
              aspectRatio: 16 / 9,
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              itemCount: secondSliderList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  secondSliderList[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(EdgeInsets.symmetric(horizontal: 8))
                    .make();
              }),

          //3 ota buttons----
          10.heightBox,
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  3,
                  (index) => homeButtons(
                      context.screenHeight * 0.16,
                      context.screenWidth / 3.5,
                      index == 0
                          ? icTopCategories
                          : index == 1
                              ? icBrands
                              : icTopSeller,
                      index == 0
                          ? "Top categories"
                          : index == 1
                              ? "Top Brands"
                              : "Top Sellers",
                      () {}))),

          //Featured box----------
          10.heightBox,
          Align(
              alignment: Alignment.centerLeft,
              child: "Featured Box"
                  .text
                  .size(18)
                  .fontFamily(semibold)
                  .color(fontGrey)
                  .make()),
        ]),
      ),
    );
  }
}
