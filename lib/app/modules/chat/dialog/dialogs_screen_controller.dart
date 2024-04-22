import 'package:bridgme/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared/components/no_items.dart';
import '../../../shared/components/utility/custom_toolbar_widget.dart';
import '../../../shared/constants/base_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common_widget.dart';
import '../../../shared/utils/session.dart';
import 'controller/dialogs_screen_controller.dart';


class DialogScreen extends StatelessWidget {
  DialogsScreenController controller = Get.put(DialogsScreenController());

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
    return LayoutBuilder(builder: (context, constraints) {
      return buildMobile(controller);
    });
  }

  SafeArea buildMobile(DialogsScreenController controller) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 43),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return controller.getDialogs();
                    },
                    child: Obx(() {
                      if (controller.loadingStatus.value == 0) {
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
                      } else if (controller.loadingStatus.value == 1) {
                        return Center(child: Container(child: CircularProgressIndicator()));
                      } else {
                        return RefreshIndicator(
                          onRefresh: () {
                            return controller.getDialogs();
                          },
                          child: Container(
                            child: NoItems(
                              imagePath: "assets/images/nochats.svg",
                              title: "No messages",
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

class ToolBar extends StatelessWidget {
  const ToolBar(
      String title,
      Null Function() iconClick, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: Colors.black26,
                width: 1.5,
              ))),
      child: Container(
        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/images/backarrow.svg",
                height: 11.62,
                width: 24,
                color: Colors.black,
              ),
            ),
            CommonWidget.rowWidth(width: 14),
            Text("Messages",
                style: TextStyle(
                    color: Cc.kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

