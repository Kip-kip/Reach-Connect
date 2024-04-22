
import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/components/no_items.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/constants/colors.dart';
import 'dialogs_logic.dart';

class DialogPage extends GetView<DialogsLogic> {
  Container ImagePlaceholder() {
    return Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.black12, width: 0.5),
          image: DecorationImage(
              image: AssetImage('assets/images/avatar60.jpeg'),
              fit: BoxFit.cover),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return controller.getDialogs();
                    },
                    child: Obx(() {
                      if (controller.dialogList.isNotEmpty) {
                        return RefreshIndicator(
                          onRefresh: () {
                            return controller.getDialogs();
                          },
                          child: ListView.builder(
                            itemCount: controller.dialogList.length,
                            itemBuilder: (context, index) {
                              var notification = controller.dialogList[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    // notification.message = "Hello";
                                    // notificationController.appDatabase.firebaseMessageDataDao
                                    //     .updateFirebaseMessageData(notification);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.black26,
                                      width: 0.5,
                                    ))),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 0, bottom: 0),
                                      child: InkWell(
                                        onTap: () {
                                          Get.rootDelegate.toNamed(Routes.INBOX,
                                              parameters: {
                                                "dialogId": controller
                                                    .dialogList[index].id,
                                                "title": controller
                                                    .getDialogTitle(
                                                        notification.ownersData)
                                                    .userName
                                                    .capitalizeFirst!,
                                                "image": controller
                                                    .getDialogTitle(
                                                        notification.ownersData)
                                                    .image,
                                                "user": controller
                                                    .getDialogTitle(
                                                        notification.ownersData)
                                                    .user
                                              });
                                        },
                                        child: ListTile(
                                          leading: CachedNetworkImage(
                                            width: 40,
                                            height: 40,
                                            imageUrl: SessionUtils
                                                .getAvatarLink(controller
                                                    .getDialogTitle(
                                                        notification.ownersData)
                                                    .user),
                                            placeholder: (context, url) =>
                                                ImagePlaceholder(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    ImagePlaceholder(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            controller
                                                .getDialogTitle(
                                                    notification.ownersData)
                                                .userName
                                                .capitalize!,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Cc.defaultTextColor),
                                          ),
                                          subtitle: Text(
                                            notification.lastMessageText == null
                                                ? ""
                                                : notification.lastMessageText,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black54,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          trailing: Text(
                                            notification.lastMessageTime == null
                                                ? "4.45 pm"
                                                : DateFormat.jm().format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        notification
                                                            .lastMessageTime)),
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }, //
                            // use it
                          ),
                        );
                      } else {
                        return RefreshIndicator(
                          onRefresh: () {
                            return controller.getDialogs();
                          },
                          child: Container(
                            child: NoItems(
                              imagePath: "assets/images/nochats.svg",
                              title:
                                  "No message s${controller.dialogList.length}",
                              message: "Your conversations will be listed here",
                              showBackButton: false,
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
