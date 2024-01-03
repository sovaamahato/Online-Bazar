import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
    child: "Cart is Empty".text.color(darkFontGrey).makeCentered(),);
  }
}