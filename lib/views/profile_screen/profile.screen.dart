import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/firebase_consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/controllers/auth_controllers.dart';
import 'package:online_bazar/services/firestore_services.dart';
import 'package:online_bazar/views/auth/login_screen.dart';
import 'package:online_bazar/views/profile_screen/details_card.dart';
import 'package:online_bazar/views/profile_screen/edit_profile_screen.dart';

import 'package:online_bazar/widgets/bg_widget.dart';

import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWiddget(
        title: "",
        ch: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ));
            } else {
              var data = snapshot.data!.docs[0];
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,

                    //edit wala button -------------------
                    child: IconButton(
                        onPressed: () {
                          controller.nameController.text = data['name'];
                          controller.passController.text = data['password'];
                          Get.to(() => EditProfileScreen(
                                data: data,
                              ));
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                  //row profile [photo wala]

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        data['imgurl'] == ''
                            ? Image.asset(
                                imgProfile,
                                width: 70,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imgurl'],
                                width: 70,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .white
                                .fontFamily(bold)
                                .size(17)
                                .make(),
                            "${data['email']}"
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
                          await Get.put(AuthController())
                              .signoutmethod(context);
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
                          child: "Logout".text.white.makeCentered(),
                        ),
                      ),
                    ],
                  ),
                  20.heightBox,

                  //3 ota boxes
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(context.screenWidth / 3.5,
                            data['cart_count'], "in Your cart"),
                        detailsCard(
                          context.screenWidth / 3.5,
                          data['wishlist_count'],
                          "in Your wishlist",
                        ),
                        detailsCard(context.screenWidth / 3.5,
                            data['order_count'], "you've ordered"),
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
              );
            }
          },
        ),
        top: 20);
  }
}
