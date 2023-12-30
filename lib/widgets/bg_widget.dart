

import 'package:flutter/material.dart';

import '../consts/consts.dart';

class bgWiddget extends StatelessWidget {
  //const bgWiddget({super.key});
  String? title;
  final ch ;
  bgWiddget({super.key, required this.title,required this.ch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
              color: Colors.white,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: redColor,
                height:context.screenHeight * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      20.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: title!.text.white.fontFamily(bold).size(22).make()),
                    ],
                  ),
                ),
                
              ),
            ),
      
             Positioned(
              top: context.screenHeight * 0.07,
              left: context.screenWidth * 0.02,
              right: context.screenWidth * 0.02,
              child: SingleChildScrollView(
                child: ch)),
        ],
      ),
    );
  }
}

//Widget bgWiddget({required Scaffold ch}) {
//   return Stack(children: [
//     
   
//    // body:
//      Container(
//       //resizeToAvoidBottomInset: false,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
          
//             image: AssetImage(
//               imgBackground,
//             ),
//             ),
//       ),
//       child: ch,
      
   
//   );
// }
