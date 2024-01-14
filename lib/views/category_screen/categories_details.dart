import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/controllers/product_controllers.dart';
import 'package:online_bazar/services/firestore_services.dart';
import 'package:online_bazar/views/category_screen/item_details.dart';
import 'package:online_bazar/widgets/bg_widget.dart';

import '../../widgets/loading_indicator.dart';

class CategoriesDetails extends StatelessWidget {
  //const CategoriesDetails({super.key});
  String title;
  CategoriesDetails({required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWiddget(
      title: title,
      top: context.screenHeight * 0.13,
      ch: StreamBuilder(
        stream: FirestoreServices.getproduct(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No products found".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;

            return Container(
              //padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  //row item box wala --
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .makeCentered()
                              .box
                              .white
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .size(120, 60)
                              .roundedSM
                              .make()),
                    ),
                  ),
                  20.heightBox,
                  Container(
                    height: 500,
                    width: context.screenWidth,
                    //color: whiteColor,
                    child: Expanded(
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //img
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  width: 200,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .size(19)
                                    .make(),

                                //desciption,
                                // "${data[index]['p_desc']}"
                                //     .text
                                //     .fontFamily(semibold)
                                //     .color(darkFontGrey)
                                //     .make(),
                                // //price
                                "${data[index]['p_price']}"
                                    .numCurrency
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
                                .outerShadowSm
                                .padding(EdgeInsets.all(10))
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 12))
                                .make()
                                .onTap(() {
                              controller.checkIfFav(data[index]);
                              Get.to(
                                () => ItemDetails(
                                  title: "${data[index]['p_name']}",
                                  data: data[index],
                                ),
                              );
                            });
                          }),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
