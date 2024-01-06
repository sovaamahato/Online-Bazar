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
              CustomTextField(
                  title: "PassWord",
                  obScure: true,
                  hint: "..",
                  controller: controller.passController),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 40,
                      child: MyButton("Save", redColor, whiteColor, () async {
                        controller.isloading(true);
                        //await controller.uploadProfileImage();
                        await controller.updateProfile(
                            controller.nameController.text,
                            controller.passController.text,
                            controller.profileimageLink);
                        VxToast.show(context, msg: "Updated successfully");
                      })),
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
