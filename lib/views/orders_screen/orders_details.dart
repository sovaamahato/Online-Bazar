import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/views/orders_screen/components/order_placed_details.dart';
import 'package:online_bazar/views/orders_screen/components/order_status.dart';
import "package:intl/intl.dart" as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  OrdersDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).make(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(children: [
            orderStatus(
                color: Colors.red,
                icon: Icons.done,
                showDone: data['order_placed'],
                title: "Order placed"),
            orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                showDone: data['order_confirmed'],
                title: "Order Confirmed"),
            orderStatus(
                color: const Color.fromARGB(255, 167, 151, 4),
                icon: Icons.electric_bike,
                showDone: data['order_on_delivery'],
                title: "Delivery"),
            orderStatus(
                color: Colors.purple,
                icon: Icons.done_all_rounded,
                showDone: data['order_delivered'],
                title: "Delivered"),
            Divider(),
            10.heightBox,
            Column(
              children: [
                orderPlacedDetails(
                    d2: data['shipping_method'],
                    d1: data['order_code'],
                    title1: "Order code",
                    title2: "Shipping method"),
                orderPlacedDetails(
                    d1: intl.DateFormat()
                        .add_yMd()
                        .format(data['order_date'].toDate()),
                    d2: data['payment_method'],
                    title1: "Order Date",
                    title2: "Payment method"),
                orderPlacedDetails(
                    d1: "unpaid",
                    d2: "Order Placed",
                    title1: "Payment status",
                    title2: "Delivery status"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address"
                                .text
                                .fontFamily(semibold)
                                .size(17)
                                .make(),
                            "${data['order_by_name']}".text.make(),
                            "${data['order_by_email']}".text.make(),
                            "${data['order_by_address']}".text.make(),
                            "${data['order_by_city']}".text.make(),
                            "${data['order_by_state']}".text.make(),
                            "${data['order_by_phone']}".text.make(),
                            //"${data['order_by_postalcode']}".text.make(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 135,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Total Amount"
                                .text
                                .fontFamily(semibold)
                                .size(20)
                                .make(),
                            "${data['total_amount']}"
                                .text
                                .fontFamily(bold)
                                .color(redColor)
                                .make()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ).box.outerShadowMd.white.make(),

            //ordered product

            10.heightBox,
            "Ordered Product"
                .text
                .size(16)
                .color(darkFontGrey)
                .fontFamily(semibold)
                .makeCentered(),

            10.heightBox,
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(data['orders'].length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orderPlacedDetails(
                        title1: data['orders'][index]['title'],
                        title2: data['orders'][index]['tprice'],
                        d1: "${data['orders'][index]['qty']} x",
                        d2: "Refundable"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 25,
                        height: 20,
                        color: Color(data['orders'][index]['color']),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }).toList(),
            )
                .box
                .outerShadowMd
                .margin(const EdgeInsets.only(bottom: 4))
                .white
                .make(),
            20.heightBox,
          ]),
        ),
      ),
    );
  }
}
