import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/controllers/auth_controllers.dart';
import 'package:online_bazar/views/auth/login_screen.dart';
import 'package:online_bazar/views/profile_screen/details_card.dart';

import 'package:online_bazar/widgets/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWiddget(
        title: "",
        ch: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    //Get.to(() => HomeScreen());
                  },
                  icon: const Icon(Icons.edit)),
            ),
            //row profile [photo wala]

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset(
                    imgProfile,
                    width: 70,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Sova kushwaha"
                          .text
                          .white
                          .fontFamily(bold)
                          .size(17)
                          .make(),
                      "sovakushwaha618@gmail.com"
                          .text
                          .size(12)
                          .color(textfieldGrey)
                          .make(),
                    ],
                  ),
                ]),
                20.widthBox,
                //logout button
                GestureDetector(
                  onTap: () async {
                    await Get.put(AuthController()).signoutmethod(context);
                    Get.offAll(() => LoginScreen());
                  },
                  child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: "Logout".text.white.makeCentered()),
                ),
              ],
            ),
            20.heightBox,

            //3 ota boxes
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              detailsCard(context.screenWidth / 3.5, "00", "in Your card"),
              detailsCard(context.screenWidth / 3.5, "12", "in Your wishlist"),
              detailsCard(context.screenWidth / 3.5, "00", "you've ordered"),
            ]),
            20.heightBox,
            //big white box
            ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: profileButtonsList[index].text.make(),
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 20,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonsList.length)
                .box
                .shadowSm
                .white
                .rounded
                .make()
          ],
        ),
        top: 20);
  }
}
