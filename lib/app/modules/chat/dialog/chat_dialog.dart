import 'package:bridgme/app/modules/chat/user_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/user/user_model_entity.dart';
import '../../../shared/constants/storage.dart';
import 'chat_dialog_controller.dart';
import '../call/calls_page.dart';

class ChatDialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatDialogPageState();
  }
}

class ChatDialogPageState extends State<ChatDialogPage> {
  late ChatDialogController _chatDialogController;

  @override
  void initState() {
    _chatDialogController = Get.put(ChatDialogController());
    _chatDialogController.listenerForNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Obx(() {
        print(_chatDialogController.message);
        return GetNotificationList(ChatDialogController: _chatDialogController);
      })),
    );
  }
}

class GetNotificationList extends StatelessWidget {
  const GetNotificationList({
    Key? key,
    required ChatDialogController ChatDialogController,
  })  : _chatDialogController = ChatDialogController,
        super(key: key);

  final ChatDialogController _chatDialogController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _chatDialogController.notificationList.length,
        itemBuilder: (context, index) {
          var notification = _chatDialogController.notificationList[index];
          return Padding(
            padding: EdgeInsets.only(top: 8),
            child: GestureDetector(
              onTap: () {
                final prefs = Get.find<SharedPreferences>();
                var userId = prefs.getString(StorageConstants.userEmail);
                var receiverId =
                    _chatDialogController.notificationList[index].title;
                var intiateCall = userId!.trim() == "mfalme@gmail.com";
                Get.to((){
                  return CallsPage(
                    receiverUserId: notification.title,
                    userId: userId,
                    initiateCall: intiateCall,
                    receiverName: receiverId,
                    callType: "VIDEO_CALL",
                  );
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: ListTile(
                  leading: Container(
                      height: 56,
                      width: 56,
                      child: UserImage(
                        user: UserModelEntity(),
                        token: '',
                      )),
                  title: Text(
                    notification.title!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    notification.text == null ? "" : notification.text!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    "10.04pm",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
