import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/controllers/profile_controller.dart';

import 'package:online_bazar/widgets/bg_widget.dart';
import 'package:online_bazar/widgets/custom_textfield.dart';
import 'package:online_bazar/widgets/my_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWiddget(
        title: "Edit Profile",
        ch: Center(
                child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imgurl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 70,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['imgurl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imgurl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              MyButton("Change", redColor, whiteColor, () {
                controller.changeImage(context);
              }),
              const Divider(),
              20.heightBox,
              CustomTextField(
                  title: "User Name",
                  obScure: false,
                  hint: "..",
                  controller: controller.nameController),
              10.heightBox,
              CustomTextField(
                  title: "Old PassWord",
                  obScure: true,
                  hint: "..",
                  controller: controller.oldpassController),
              10.heightBox,
              CustomTextField(
                  title: "New PassWord",
                  obScure: true,
                  hint: "..",
                  controller: controller.newpassController),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 40,
                      child: MyButton(
                        "Save",
                        redColor,
                        whiteColor,
                        () async {
                          controller.isloading(true);

                          //if new image is not selected for changing
                          if (controller.profileImgPath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileimageLink = data['imgurl'];
                          }

                          //if old password matches database
                          if (data['password'] ==
                              controller.oldpassController.text) {
                            await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldpassController.text,
                                newPassword: controller.newpassController.text);
                            await controller.updateProfile(
                                controller.nameController.text,
                                controller.newpassController.text,
                                controller.profileimageLink);
                            VxToast.show(context, msg: "Updated successfully");
                          } else {
                            VxToast.show(context, msg: "Wrong old password");
                            controller.isloading(false);
                          }
                        },
                      ),
                    ),
            ],
          ),
        ))
            .box
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 15))
            .white
            .make(),
        top: 120);
  }
}
