import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/views/home_screen/components/my_featured_box.dart';
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
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
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

                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    myFeaturedbox(
                                        icon: featuredImages1[index],
                                        title: featuredTitle1[index]),
                                    10.heightBox,
                                    myFeaturedbox(
                                        icon: featuredImages2[index],
                                        title: featuredTitle2[index]),
                                  ],
                                ))),
                  ),

                  //featured product----------------
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: redColor,
                    ),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: "Featured Product"
                                .text
                                .size(18)
                                .white
                                .fontFamily(bold)
                                .make()),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //img
                                        Image.asset(
                                          imgP1,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        //desciption,
                                        "Description"
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                        //price
                                        "price"
                                            .text
                                            .color(redColor)
                                            .size(16)
                                            .fontFamily(bold)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .roundedSM
                                        .padding(EdgeInsets.all(10))
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 5))
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //3rd swiper----------------------------
                  20.heightBox,
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

                  //product list section------------------------
                  20.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //img
                            Image.asset(
                              imgP3,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            //desciption,
                            "Description"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            //price
                            "price"
                                .text
                                .color(redColor)
                                .size(16)
                                .fontFamily(bold)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .roundedSM
                            .padding(EdgeInsets.all(10))
                            .margin(const EdgeInsets.symmetric(horizontal: 12))
                            .make();
                      })
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
