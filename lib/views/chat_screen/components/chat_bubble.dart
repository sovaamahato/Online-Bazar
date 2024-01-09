import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:online_bazar/consts/firebase_consts.dart';

Widget senderBubble(DocumentSnapshot data) {
  var t =
      data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);

  return Directionality(
    textDirection:
        data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
          color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomRight: data['uid'] == currentUser!.uid
                ? const Radius.circular(0)
                : const Radius.circular(20),
            bottomLeft: data['uid'] == currentUser!.uid
                ? const Radius.circular(20)
                : const Radius.circular(0),
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        "${data['msg']}".text.size(16).white.make(),
        10.heightBox,
        time.text.color(whiteColor.withOpacity(0.5)).make(),
      ]),
    ),
  );
}
