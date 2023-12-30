import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget bgWiddget(Widget? ch) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          
            image: AssetImage(
              imgBackground,
            ),
            fit: BoxFit.fill),
      ),
      child: ch,
      
    ),
  );
}
