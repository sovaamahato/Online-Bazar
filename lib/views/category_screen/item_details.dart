import 'package:flutter/material.dart';
import 'package:online_bazar/consts/colors.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/widgets/my_button.dart';

class ItemDetails extends StatelessWidget {
  //const ItemDetails({super.key});
  String? title;
  ItemDetails({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(title: title!.text.make(), actions: [
        IconButton(
          onPressed: () {},
          icon:const  Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline),
        )
      ]),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 290,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  //ttile and description part
                  title!.text
                      .color(darkFontGrey)
                      .size(16)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  //ratings
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  //price
                  "Rs.3,000"
                      .text
                      .fontFamily(bold)
                      .color(redColor)
                      .size(18)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Seller"
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .padding(EdgeInsets.symmetric(horizontal: 10))
                      .color(textfieldGrey)
                      .height(60)
                      .make(),
                  20.heightBox,

                  //color choosing section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(darkFontGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(30, 30)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 5))
                                    .make()),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(10)).make(),

                      //quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: ".text.color(darkFontGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove)),
                            "0"
                                .text
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGrey).make(),
                          ])
                        ],
                      ).box.padding(const EdgeInsets.all(10)).make(),

                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(darkFontGrey).make(),
                          ),
                          "Rs. 3,000"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .make(),
                        ],
                      )
                          .box
                          .padding(const EdgeInsets.all(10))
                          .color(lightGolden)
                          .make(),
                    ],
                  ).box.white.shadowSm.make(),

                  //descprition section

                  10.heightBox,
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "This is a dummy item and dummy description ."
                      .text
                      .color(textfieldGrey)
                      .make(),
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        itemButtomDetails.length,
                        (index) => ListTile(
                              title: itemButtomDetails[index].text.semiBold.make(),
                            )),
                  ),
                  20.heightBox,
                  //product may like section
                  "Product you may also like".text.fontFamily(bold).color(darkFontGrey).make(),
                  10.heightBox,
                  //copied from home screen featured product-----------------
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
          )),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: MyButton("Add to cart", redColor, whiteColor, () {}),
          )
        ],
      ),
    );
  }
}
