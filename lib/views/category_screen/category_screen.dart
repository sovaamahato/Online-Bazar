import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/views/category_screen/categories_details.dart';

import 'package:online_bazar/widgets/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWiddget(
      ch: Container(
        
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(children: [
                //images 
                Image.asset(categoriesImgList[index],height: 100, width: 200,fit: BoxFit.cover  ,),
                10.heightBox,
                categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make()

                //
              ],).box.white.rounded.clip(Clip.antiAlias).outerShadowMd.make().onTap(() {
                Get.to(()=>CategoriesDetails(title: categoriesList[index]));
              });
            }),
      ),
      title: 'Categories',
      top: 110,
    );
  }
}
