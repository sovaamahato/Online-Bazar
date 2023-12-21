import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/widgets/bg_widget.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWiddget(
     
         Container(
        child: Center(
            child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            //applogo wodget(its remaining to create)

            //space
            10.heightBox,

            //text
            "log in to $appname".text.fontFamily(bold).white.size(18).make(),

            //space
            10.heightBox,

            //login wala container here---------------
          ],
        )),
      )
    );
  }
}
