import 'package:flutter/material.dart';
import 'package:online_bazar/consts/consts.dart';
import 'package:online_bazar/views/chat_screen/components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title: "Title".text.fontFamily(semibold).color(redColor).make()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: ListView(children: [
                //chat bubble----------------------
                senderBubble(),
              ]),
              color: Colors.teal,
            )),
            10.heightBox,
            //textfield to type message------------------
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      ),
                    ),
                  ),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            )
                .box
                .height(80)
                .margin(const EdgeInsets.only(bottom: 8))
                .padding(const EdgeInsets.all(12))
                .make(),
          ],
        ),
      ),
    );
  }
}
