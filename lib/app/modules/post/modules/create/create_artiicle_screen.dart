import 'package:bridgme/app/modules/post/controllers/article_controller.dart';
import 'package:bridgme/app/shared/components/utility/custom_toolbar_widget.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';


class CreateArticleScreen extends GetView<ArticleController> {
  InputDecoration getInputDecoration(String label) {
    return InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Cc.kPrimaryColor)),
        focusColor: Cc.kPrimaryColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Cc.kPrimaryColor,
        )),
        floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),
        labelText: label,
        hintText: label);
  }

  InputDecoration getInputDecorationy(String label) {
    return InputDecoration(
        hintStyle: TextStyle(),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Cc.kPrimaryColor)),
        focusColor: Cc.kPrimaryColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Cc.kPrimaryColor,
        )),
        floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),
        alignLabelWithHint: true,
        hintText: label);
  }

  InputDecoration getInputDecorationx(String label) {
    return InputDecoration(
        hintStyle: TextStyle(fontSize: 12),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Cc.kPrimaryColor)),
        focusColor: Cc.kPrimaryColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Cc.kPrimaryColor,
        )),
        floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),
        hintText: label);
  }

  var categories = ["Happy", "Sad", "Depressd"];

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 43),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomToolBarWidget(title: "Write Article"),
                Container(
                  margin: EdgeInsets.only(right: 9, left: 9),
                  child: Column(children: [
                    CommonWidget.rowHeight(height: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            CommonWidget.rowHeight(height: 0),
                            InkWell(
                              onTap: () {
                                controller.uploadPic();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                      child: Column(
                                    children: [
                                      CommonWidget.rowHeight(height: 12),
                                      SvgPicture.asset(
                                        'assets/images/upload.svg',
                                      ),
                                      CommonWidget.rowHeight(height: 12),
                                      Text(
                                        "upload photo",
                                        style: TextStyle(color: Colors.black45, fontSize: 10),
                                      ),
                                      CommonWidget.rowHeight(height: 12),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                            CommonWidget.rowHeight(height: 12),
                            Obx(() {
                              return controller.postImage.value.isEmpty
                                  ? SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Image uploaded"),
                                        IconButton(
                                            onPressed: () {
                                              controller.postImage.value = "";
                                            },
                                            icon: Icon(Icons.clear,
                                                color: Cc.kPrimaryColor))
                                      ],
                                    );
                            }),
                            CommonWidget.rowHeight(height: 0),
                            Obx(() {
                              controller.mood.value;
                              return DropdownButtonFormField(
                                icon: Icon(EvaIcons.chevronDown),
                                items: controller.moods.map((String category) {
                                  return new DropdownMenuItem(
                                      value: category,
                                      child: Row(
                                        children: [
                                          Text(
                                            category,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                                onChanged: (newValue) {
                                  print(newValue);
                                  controller.mood.value = newValue as String;
                                },
                                decoration: getInputDecorationx(
                                    "Pick mood e.g Depressed...."),
                              );
                            }),
                            CommonWidget.rowHeight(height: 12),
                            Obx(() {
                              controller.category.value;
                              return DropdownButtonFormField(
                                icon: Icon(EvaIcons.chevronDown),
                                items: controller.categories
                                    .map((String category) {
                                  return new DropdownMenuItem(
                                      value: category,
                                      child: Row(
                                        children: [
                                          Text(
                                            category,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                                onChanged: (newValue) {
                                  print(newValue);
                                  controller.category.value =
                                      newValue as String;
                                },
                                decoration: getInputDecorationx(
                                    "Pick mood category...."),
                              );
                            }),
                            CommonWidget.rowHeight(height: 12),
                            TextFormField(
                                style: style,
                                showCursor: true,
                                controller: controller.titleController,
                                cursorColor: Cc.kPrimaryColor,
                                decoration:
                                    getInputDecoration('Article Title')),
                            CommonWidget.rowHeight(height: 12),
                            TextField(
                                minLines: 15,
                                //Normal textInputField will be displayed
                                maxLines: 20,
                                //
                                style: style,
                                controller: controller.textController,
                                textAlign: TextAlign.start,
                                decoration:
                                    getInputDecorationy('Type here...')),
                            CommonWidget.rowHeight(height: 12),
                            FlatButton(
                                minWidth: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Create post',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                color: Cc.kPrimaryColor,
                                onPressed: () {
                                  controller.createPost(context);
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                )),
                            CommonWidget.rowHeight(height: 12),
                            CommonWidget.rowHeight(height: context.height)
                          ]),
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
