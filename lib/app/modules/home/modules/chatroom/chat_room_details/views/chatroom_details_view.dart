import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;


import '../../../../../../shared/constants/constants.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../widgets/message_item.dart';
import '../controllers/chatroom_details_logic.dart';

class ChatroomDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChatroomDetailsLogic>();


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Obx(() {
            return CustomAppBar(
              appBarText: logic.selectedChatroom.value.title,);
          })),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[

                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.3,
                            decoration: BoxDecoration(
                                color: kColorGreen,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 8),

                          child: Container(
                            decoration: BoxDecoration(
                                color: kColorLight,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          const CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: AssetImage(
                                                'assets/images/happy-woman.jpeg'),
                                          ),
                                          SizedBox(width: 10.0),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              Obx(() {
                                                return Text(
                                                    logic.selectedChatroom.value
                                                        .ownerId,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight
                                                            .normal));
                                              }),


                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: const <Widget>[
                                          Text("",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5.0,),
                                          Text("")
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                  ),
                                  SizedBox(
                                    child: Obx(() {
                                      return Text(
                                          logic.selectedChatroom.value.text);
                                    }),

                                  ),
                                  Divider(
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                color: kColorGreen,
                                                border: Border.all(
                                                  color: kColorGreen,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))
                                            ),

                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Obx(() {
                                              return Text(logic
                                                  .selectedChatroom.value
                                                  .category,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13));
                                            }),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                                EvaIcons
                                                    .messageCircleOutline,
                                                size: 14,
                                                color: Colors.grey),
                                            Text(
                                              " No comments",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Deep stuff',
                    ),
                    SizedBox(
                        height: 10
                    ),
                    MessageItem(
                      send: false,
                      message: 'I hope everything is fine now',
                    ),


                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 0.5),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[250],
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'Enter message',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        autofocus: false,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorWidth: 1,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

