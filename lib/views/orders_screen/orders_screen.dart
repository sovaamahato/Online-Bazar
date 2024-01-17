import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/services/firestore_services.dart';
import 'package:online_bazar/views/orders_screen/orders_details.dart';
import 'package:online_bazar/widgets/loading_indicator.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "MY Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No orders yet!".text.makeCentered();
            } else {
              var data = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: "${index}"
                          .text
                          .xl
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .make(),
                      title: data[index]['order_code']
                          .toString()
                          .text
                          .color(redColor)
                          .fontFamily(semibold)
                          .make(),
                      subtitle: data[index]['total_amount']
                          .toString()
                          .numCurrency
                          .text
                          .fontFamily(bold)
                          .make(),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: darkFontGrey,
                        ),
                        onPressed: () {
                          Get.to(() => OrdersDetails(
                                data: data[index],
                              ));
                        },
                      ),
                    );
                  });
            }
          }),
    );
  }
}
