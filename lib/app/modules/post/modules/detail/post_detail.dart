import 'package:bridgme/app/modules/chat/user_image.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/app/shared/widgets/gradient_background.dart';
import 'package:bridgme/models/user/user_model_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../models/article/article_entity.dart';
import 'post_detail_screen_controller.dart';

class PostDetail extends StatefulWidget {
  PostDetail(postId, Post? post);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  dynamic args = Get.arguments;

  late String postId;

  late PostDetailScreenController? controller;
  var whiteColor = 255;

  @override
  void initState() {
    Post? post;
    if (args != null) {
      postId = args[0];
      post = args[1];
    }

    controller = PostDetailScreenController(postId);
    if (post != null) {
      controller!.currentPost.value = post;
      controller!.getSinglePost(postId);
    } else {
      controller!.getSinglePost(postId);
    }

    super.initState();
  }

  Container ImagePlaceholder() {
    return Container(
        width: 68.0,
        height: 68.0,
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
    return Obx(() {
      return controller == null ||
              controller!.currentPost.value.postId.length == 0
          ? Center(child: CircularProgressIndicator(color: Cc.kPrimaryColor))
          : Stack(
              children: [
                Container(
                  height: Get.height * .6,
                  child: Stack(
                    children: [
                      Hero(
                        tag: controller!.currentPost.value.postId,
                        child: GradientBackground(
                          title: controller!.currentPost.value.title,
                          imageUrl: controller!.currentPost.value.image,
                          needWave: false,
                        ),
                      ),
                    ],
                  ),
                ),

                // _buildListItems( controller!),
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (DraggableScrollableNotification dsn) {
                    return true;
                  },
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.65,
                      minChildSize: 0.65,
                      maxChildSize:
                          controller!.scrollOffset.value != 1 ? 1 : 0.8,
                      builder: (context, snapshot) {
                        return ListView(
                          controller: snapshot,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    whiteColor, whiteColor, whiteColor, 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8,
                                          bottom: 4),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(() {
                                            return CachedNetworkImage(
                                              width: 40,
                                              height: 40,
                                              imageUrl:
                                                  SessionUtils.getAvatarLink(
                                                      controller!.currentPost
                                                          .value.ownerId),
                                              placeholder: (context, url) =>
                                                  ImagePlaceholder(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      ImagePlaceholder(),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 68.0,
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            );
                                          }),
                                          CommonWidget.rowWidth(width: 8),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                // Get.to(TherapistDetail(),
                                                //     arguments: [
                                                //       controller!.currentPost
                                                //           .value.ownerId
                                                //     ]);
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() {
                                                    return Text(
                                                        "Dr. " +
                                                            controller!
                                                                .currentPost
                                                                .value
                                                                .authorName,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ));
                                                  }),
                                                  Text(
                                                    controller!.currentPost
                                                        .value.createdAt,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black45),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, top: 10, right: 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ReadMoreText(
                                              controller!
                                                  .currentPost.value.text,
                                              callback: (bool) {
                                                if (bool) {
                                                  controller!
                                                      .scrollOffset.value = 1;
                                                } else {
                                                  controller!
                                                      .scrollOffset.value = 0;
                                                }
                                              },
                                              trimLines: 9,
                                              colorClickableText: Colors.black,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: 'read more',
                                              trimExpandedText: 'see less',
                                              style: TextStyle(
                                                  color: Cc.defaultTextColor,
                                                  fontSize: 14),
                                              lessStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                              moreStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            CommonWidget.rowHeight(height: 14),
                                            Text("Talk to a professional",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Cc.defaultTextColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                """It’s normal to feel under the weather from time to time, it’s what makes us human! Talk it out.""",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12)),
                                            CommonWidget.rowHeight(height: 10),
                                            FlatButton(
                                                minWidth: double.infinity,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Find a councelor',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                color: Cc.kPrimaryColor,
                                                onPressed: () {},
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          5.0),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Obx(() {
                  return controller!.scrollOffset.value == 1
                      ? Positioned(
                          child: Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.bookmark_border_outlined,
                                size: 25,
                              ),
                              onPressed: () {
                                controller!.addBookMark(args[0]);
                              },
                            ),
                          ),
                          top: Get.height * .355,
                          right: Get.width * .08,
                        )
                      : SizedBox();
                }),
              ],
            );
    });
  }

  Widget _buildListItems(PostDetailScreenController controller) {
    var whiteColor = 255;
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.6,
          maxChildSize: 1,
          builder: (context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(whiteColor, whiteColor, whiteColor, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 4),
                      child: Row(
                        children: [
                          CommonWidget.rowWidth(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.currentPost.value.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              Text(
                                controller.currentPost.value.createdAt,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black45),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReadMoreText(
                              controller.currentPost.value.text,
                              trimLines: 10,
                              colorClickableText: Colors.black,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'read more',
                              trimExpandedText: 'read less',
                              style: TextStyle(
                                  color: Cc.defaultTextColor, fontSize: 14),
                              moreStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            CommonWidget.rowHeight(height: 14),
                            Text("Talk to a proffesional",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Cc.defaultTextColor,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                """It’s normal to feel under the weather from time to time, it’s what makes us human! Talk it out.""",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12)),
                            CommonWidget.rowHeight(height: 10),
                            FlatButton(
                                minWidth: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Book Appointment',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                color: Cc.kPrimaryColor,
                                onPressed: () {},
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                )),
                            SizedBox(height: 500),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
