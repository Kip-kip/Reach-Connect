import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step1/controllers/healthcare_concern_logic.dart';
import 'package:bridgme/app/shared/components/no_items.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/constants.dart';
import 'chatroom_logic.dart';

class ChatroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChatroomLogic>();
    final _categoryController = Get.put(HealthcareConcernLogic());

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Column(
        children: [
          Container(
            height: Get.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Filter category",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                Spacer(),
                IconButton(onPressed: (){
                  Get.rootDelegate.toNamed(Routes.NEW_CHAT_ROOM);
                }, icon:Icon( EvaIcons.plusSquareOutline)),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "Select Category",
                                style: TextStyle(fontSize: 14),
                              ),
                              content: Obx(() {
                                return Wrap(
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: 4.0, // gap between lines
                                    children: _categoryController
                                        .articleCategories
                                        .map((item) => logic
                                                    .checkIfCategoryIsAlreadySelected(
                                                        item.categoryid)
                                                ? FlatButton(
                                                    color: kColorGreen,
                                                    child: Text(
                                                      item.title ?? "",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      logic
                                                          .updateSelectedCategories(
                                                              item.categoryid);
                                                    },
                                                  )
                                                : OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: BorderSide(
                                                          width: 1.0,
                                                          color: Colors.grey),
                                                    ),
                                                    child: Text(
                                                      item.title ?? "",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () {
                                                      logic
                                                          .updateSelectedCategories(
                                                              item.categoryid);
                                                    },
                                                  )

                                            //  OutlinedButton(
                                            //   style: OutlinedButton.styleFrom(
                                            //     side: BorderSide(
                                            //         width: 1.0,
                                            //         color: Colors.grey),
                                            //   ),
                                            //   child: Text(item.name ?? "",
                                            //     style: TextStyle(
                                            //         color: Colors.black),),
                                            //   onPressed: () {
                                            //     logic.updateSelectedCategories(
                                            //         item.id);
                                            //   },
                                            // );

                                            )
                                        .toList());
                              }));
                        });
                  },
                  icon: Icon(EvaIcons.options2Outline),
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Obx(() {
                if (logic.chatRoomList.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return logic.getChatroomData();
                    },
                    child: Container(
                      child: NoItems(
                        imagePath: "assets/images/nochats.svg",
                        title: "No chatroom data",
                        message:
                            "Your Chatroom conversations will be listed here",
                        showBackButton: false,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: logic.chatRoomList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: kColorGreen,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 8, top: 8, bottom: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.rootDelegate
                                      .toNamed(Routes.CHATROOM_DETAILS);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  decoration: BoxDecoration(
                                      color: kColorLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                        logic
                                                                .chatRoomList[
                                                                    index]
                                                                .ownerId,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal))
                                                  ],
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text("")
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: Get.height * 0.23,
                                          child: Text(
                                              logic.chatRoomList[index].text),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      logic.chatRoomList[index]
                                                              .category,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13)),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0),
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
                            ),
                          ],
                        );
                      });
                }
              }),
            ),
          ),
        ],
      ),
    ));
  }
}
