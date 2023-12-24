import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:online_bazar/auth/login_screen.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/widgets/bg_widget.dart';
import 'package:online_bazar/widgets/custom_textfield.dart';
import 'package:online_bazar/widgets/my_button.dart';

import '../widgets/app_logo_widget.dart';

class SignUpScreen extends StatelessWidget {
  //const SignUpScreen({super.key});
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
          "Sign Up to $appname".text.fontFamily(bold).white.size(18).make(),

          //space
          18.heightBox,

          //login wala container here---------------
          Column(
            children: [
              CustomTextField(title: "Username", hint: "Sovaa Kushwaha"),
              CustomTextField(title: "Email", hint: "mahatosova618@gmail.com"),
              CustomTextField(title: "Password", hint: "**********"),
              CustomTextField(title: "Confirm Password", hint: "*********"),

             
             //terms and conditions check box
              8.heightBox,
              Row(
                children: [
                  Checkbox(
                      checkColor: redColor,
                      value: false,
                      onChanged: (newvalue) {}),
                  10.widthBox,
                  Expanded(
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(
                          color: fontGrey,
                          fontFamily: bold,
                        ),
                      ),
                      TextSpan(
                        text: "terms & Conditions ",
                        style: TextStyle(
                          color: redColor,
                          fontFamily: bold,
                        ),
                      ),
                      TextSpan(
                        text: " &",
                        style: TextStyle(
                          color: fontGrey,
                          fontFamily: bold,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: redColor,
                          fontFamily: bold,
                        ),
                      ),
                    ])),
                  ),
                ],
              ),
              //--------sign up button
               10.heightBox,
              MyButton("Sign Up", redColor, whiteColor, () {})
                  .box
                  .width(context.screenWidth - 50)
                  .make(),
10.heightBox,
                  Row(
                    children: [
                      "alraedy have an account?".text.color(fontGrey).make(),
                      5.widthBox,

                      //this login button is wraped with gesturedector of velocity x (you only need to write .onTap ())
                      "Login".text.color(redColor).fontFamily(bold).make().onTap(() {
                        Get.back();
                      }),
                    ],
                  ),
              5.heightBox,
            ],
          )
              .box
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ],
      )),
    ));
  }
}
