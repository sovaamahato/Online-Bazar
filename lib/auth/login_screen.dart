import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/widgets/bg_widget.dart';
import 'package:online_bazar/widgets/custom_textfield.dart';

import '../widgets/app_logo_widget.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWiddget(Container(
      child: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          //applogo wodget(its remaining to create)
          appLogoWidget(),

          //space
          10.heightBox,

          //text
          "log in to $appname".text.fontFamily(bold).white.size(18).make(),

          //space
          10.heightBox,

          //login wala container here---------------
          Column(
            children: [
              CustomTextField(title: "Email", hint: "mahatosova618@gmail.com"),
              CustomTextField(title: "Password", hint: "**********"),
              Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){}, child: "Forget Password".text.make())),
            ],
          )
              .box
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .make(),
        ],
      )),
    ));
  }
}
