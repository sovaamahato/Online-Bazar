import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:online_bazar/controllers/auth_controllers.dart';
import 'package:online_bazar/home.dart';
import 'package:online_bazar/views/auth/login_screen.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/consts/lists.dart';
import 'package:online_bazar/widgets/bg_widget.dart';
import 'package:online_bazar/widgets/custom_textfield.dart';
import 'package:online_bazar/widgets/my_button.dart';

import '../../consts/firebase_consts.dart';
import '../../widgets/app_logo_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //const SignUpScreen({super.key});

  bool? isChecked = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWiddget(
      title: "",
      ch: Center(
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

          //signup wala container here---------------
          Obx(
            () => Column(
              children: [
                CustomTextField(
                    title: "Username",
                    hint: "Sovaa Kushwaha",
                    controller: nameController,
                    obScure: false),
                CustomTextField(
                    title: "Email",
                    hint: "mahatosova618@gmail.com",
                    controller: emailController,
                    obScure: false),
                CustomTextField(
                    title: "Password",
                    hint: "**********",
                    controller: passwordController,
                    obScure: true),
                CustomTextField(
                    title: "Confirm Password",
                    hint: "*********",
                    controller: passwordRetypeController,
                    obScure: true),

                //terms and conditions check box
                8.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: redColor,
                        value: isChecked,
                        onChanged: (newvalue) {
                          setState(() {
                            isChecked = newvalue;
                          });
                        }),
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
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor))
                    : MyButton(
                        "Sign Up",
                        isChecked == true ? redColor : lightGolden,
                        isChecked == true ? whiteColor : redColor,
                        () async {
                          if (isChecked != false) {
                            controller.isLoading(true);
                            try {
                              await controller
                                  .signupMethod(emailController.text,
                                      passwordController.text, context)
                                  .then((value) {
                                return controller.storeUserData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                );
                              }).then((value) {
                                VxToast.show(context,
                                    msg: "logged in successfilly");
                                Get.offAll(() => const Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isLoading(false);
                            }
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                Row(
                  children: [
                    "alraedy have an account?".text.color(fontGrey).make(),
                    5.widthBox,

                    //this login button is wraped with gesturedector of velocity x (you only need to write .onTap ())
                    "Login"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .make()
                        .onTap(() {
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
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ),
        ],
      )),
      top: context.screenHeight * 0.07,
    );
  }
}
