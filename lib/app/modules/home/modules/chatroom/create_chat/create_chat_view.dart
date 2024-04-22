import 'package:bridgme/app/shared/components/utility/custom_toolbar_widget.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/constants/constants.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:bridgme/app/shared/widgets/uitoolkit.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_app_bar.dart';
import 'create_chat_logic.dart';

class Create_chatPage extends GetView<Create_chatLogic> {
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 12.0, height: 1.0, color: Colors.black);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(appBarText: "What's on your mind?",)),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 9, left: 9),
                  child: Column(children: [
                    CommonWidget.rowHeight(height: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
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
                                          Text(category,
                                            style: TextStyle(fontSize: 12),),
                                        ],
                                      )
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  print(newValue);
                                  controller.mood.value = newValue as String;
                                },
                                decoration: getInputDecorationx(
                                    "Pick mood e.g Depressed...."),
                              );
                            }
                            ),
                            CommonWidget.rowHeight(height: 12),
                            TextField(
                                minLines: 15,
                                //Normal textInputField will be displayed
                                maxLines: 20,
                                //
                                style: style,
                                controller: controller.textController,
                                textAlign: TextAlign.start,
                                decoration: getInputDecorationy(
                                    'Type here...')),
                            CommonWidget.rowHeight(height: 12),
                            TextFormField(
                                style: style,
                                showCursor: true,
                                controller: controller.nameController,
                                cursorColor: Cc.kPrimaryColor,
                                decoration:
                                getInputDecoration(
                                    'Post with name or anonymous')),
                            CommonWidget.rowHeight(height: 12),

                            Obx(() {
                              return controller.loadingValue.value==1? CircularProgressIndicator():
                              FlatButton(
                                  minWidth: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  color: kColorDarkGreen,
                                  onPressed: () {
                                    controller.createPost(context);
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        5.0),
                                  ));
                            }),
                            CommonWidget.rowHeight(height: 12),
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
