import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/colors.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/controllers/product_controllers.dart';
import 'package:online_bazar/widgets/my_button.dart';

class ItemDetails extends StatelessWidget {
  //const ItemDetails({super.key});
  String? title;
  final dynamic data;
  ItemDetails({required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(title: title!.text.make(), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
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
                      viewportFraction: 1.0,
                      itemCount: data['p_imgs'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['p_imgs'][index],
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
                    isSelectable: false,
                    value: double.parse(data['p_ratings']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  //price
                  "${data['p_price']}"
                      .numCurrency
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
                            "${data['p_seller']}"
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
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(darkFontGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  data['p_colors'].length,
                                  (index) => Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          VxBox()
                                              .size(30, 30)
                                              .roundedFull
                                              .color(Color(
                                                  data['p_colors'][index]))
                                              .margin(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5))
                                              .make()
                                              .onTap(() {
                                            controller.changeColorIndex(index);
                                          }),
                                          Visibility(
                                              visible: index ==
                                                  controller.colorIndex.value,
                                              child: const Icon(
                                                Icons.done,
                                                color: whiteColor,
                                              )),
                                        ],
                                      )),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(10)).make(),

                        //quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(darkFontGrey).make(),
                            ),
                            Obx(
                              () => Row(children: [
                                IconButton(
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.calculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: Icon(Icons.remove)),
                                controller.quantity.value.text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                                IconButton(
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(data['p_quantity']));
                                      controller.calculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: Icon(Icons.add)),
                                10.widthBox,
                                "(${data['p_quantity']} available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ]),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(10)).make(),

                        Obx(
                          () => Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Total: ".text.color(darkFontGrey).make(),
                              ),
                              "${controller.totalPrice.value}"
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
                        ),
                      ],
                    ).box.white.shadowSm.make(),
                  ),

                  //descprition section

                  10.heightBox,
                  "${data['p_desc']}"
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
                              title:
                                  itemButtomDetails[index].text.semiBold.make(),
                            )),
                  ),
                  20.heightBox,
                  //product may like section
                  "Product you may also like"
                      .text
                      .fontFamily(bold)
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  //copied from home screen featured product-----------------
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 5))
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
