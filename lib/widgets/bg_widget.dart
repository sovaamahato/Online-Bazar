import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget bgWiddget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imgBackground,),fit: BoxFit.fill),


    ),
    child: child,
  );
}
