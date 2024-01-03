import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/views/category_screen/item_details.dart';
import 'package:online_bazar/widgets/bg_widget.dart';

class CategoriesDetails extends StatelessWidget {
  //const CategoriesDetails({super.key});
  String title;
  CategoriesDetails({required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWiddget(
      title: title,
      top: context.screenHeight * 0.1,
      ch: Container(
        //padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //row item box wala --
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Hello"
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
                    itemCount: 6,
                    gridDelegate:
                     const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //img
                            Image.asset(
                              imgP3,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            
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
                            .outerShadowSm
                            .padding(EdgeInsets.all(10))
                            .margin(const EdgeInsets.symmetric(horizontal: 12))
                            .make().onTap(() {
                                  Get.to(()=> ItemDetails(title: "Dummy tem"));
                                });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
