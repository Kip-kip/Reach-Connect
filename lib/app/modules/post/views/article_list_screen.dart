import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import 'package:bridgme/app/modules/post/controllers/article_controller.dart';
import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../shared/components/no_items.dart';
import '../../home/widgets/custom_app_bar.dart';

class ArticleScreenList extends StatefulWidget {
  @override
  State<ArticleScreenList> createState() => _ArticleScreenListState();
}

class _ArticleScreenListState extends State<ArticleScreenList> {
  ArticleController controller = Get.find();

  @override
  void initState() {
    String filter = Get.arguments != null ? Get.arguments[0] : "";
    controller.getPosts(filter);
    super.initState();
  }

  Widget build(BuildContext context) {
    return buildMobile();
  }

  SafeArea buildMobile() {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(appBarText: "Articles",)),
        body: Container(
          child: Column(
            children: [
              Obx(() {
                return controller.posts.length == 0
                    ? Expanded(
                        child: NoItems(
                            imagePath: "assets/images/noitems.svg",
                            title: "No Articles",
                            message:
                                "Articles on selected category have not been published yet",
                            showBackButton: true))
                    : Expanded(
                        child: Container(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: RefreshIndicator(
                              onRefresh: () {
                                controller.posts.clear();
                                return controller.getPosts(Get.arguments[0]);
                              },
                              child: Obx(() {
                                if (controller.loadingStatus.value == 0) {
                                  return RefreshIndicator(
                                    onRefresh: () {
                                      controller.posts.clear();
                                      return controller
                                          .getPosts(Get.arguments[0]);
                                    },
                                    child: ListView.builder(
                                      itemCount: controller.posts.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: PostListItem(
                                                    controller: controller,
                                                    index: index),
                                              )),
                                        );
                                      }, //
                                      // use it
                                    ),
                                  );
                                } else if (controller.loadingStatus.value ==
                                    1) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return RefreshIndicator(
                                    onRefresh: () {
                                      return controller
                                          .getPosts(Get.arguments[0]);
                                    },
                                    child: Container(
                                      child: NoItems(
                                        imagePath: "assets/images/nochats.svg",
                                        title: "No Articles yes",
                                        message:
                                            "Your articles will be listed here",
                                        showBackButton: false,
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                        ),
                      );
              }),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
   PostListItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final ArticleController controller;
  final int index;
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  @override
  Widget build(BuildContext context) {
    var post = controller.posts[index];
    return InkWell(
      onTap: () {
        controller.post = post;
        Map<String, String> params = {"postId":post.postId};
        Get.rootDelegate.toNamed(Routes.JOURNAL_DETAILS,parameters: params);
        // Get.to(() {
        //   return PostDetail(post.postId,post);
        // }, arguments: [post.postId, post]);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Hero(
              tag: post.postId,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  height: 93,
                  width: 87,
                  fit: BoxFit.cover,
                  imageUrl: post.image,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      post.mood,
                      style: TextStyle(fontSize: 10, color: Cc.kPrimaryColor),
                    ),
                    CommonWidget.rowHeight(height: 4),
                    Text(
                      post.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.7)),
                    ),
                    CommonWidget.rowHeight(height: 9),
                    Row(
                      children: [
                        Text(_myAppointmentsController.getFormattedDate(int.parse(post.createdAt)).toString() +" "+_myAppointmentsController.getFormattedTime(int.parse(post.createdAt)).toString(),
                            style:
                                TextStyle(fontSize: 10.5, color: Colors.grey)),
                        CommonWidget.rowWidth(width: 2),
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 4,
                        ),
                        CommonWidget.rowWidth(width: 2),
                        Text(
                            controller.readingTime(post.text).toString() +
                                " Min read",
                            style:
                                TextStyle(fontSize: 10.5, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
