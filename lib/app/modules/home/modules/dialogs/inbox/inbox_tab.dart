import 'package:bridgme/app/modules/chat/call/outgoing_call.dart';
import 'package:bridgme/app/modules/chat/widgets/msg/receive_msg_box.dart';
import 'package:bridgme/app/modules/chat/widgets/msg/send_msg_box.dart';
import 'package:bridgme/app/shared/components/utility/custom_toolbar_widget.dart';
import 'package:bridgme/app/shared/constants/base_constants.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/constants/storage.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/app/shared/widgets/msg/msg_box.dart';
import 'package:bridgme/models/chat/message.dart';
import 'package:bridgme/models/chat/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/inbox_controller.dart';

class InboxTab extends StatefulWidget {
  const InboxTab({
    Key? key,
  }) : super(key: key);

  @override
  _InboxTabState createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  final _textController = TextEditingController();
  bool _isComposing = false;
  bool _isSelf = true;
  InboxController controller = Get.find();
  var args = Get.rootDelegate.parameters.values.toList();
  String? dialogId;

  @override
  void initState() {
    controller.getMessages(args[0], args[3], (text, isMe, time) {
      _handleSubmitted(text, isMe, time);
    });

    controller.watchChanges(args[0], args[3], (text) {
      _handleSubmitted(text, false, DateFormat.jm().format(DateTime.now()));
    });
    controller.getAppointment(args[0]);

    super.initState();

    Future.delayed(Duration(milliseconds: 250), () {
      _focusNode.requestFocus();
      controller.messages.value.forEach((message) {
        message.animationController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return mobileView(context);
  }

  SafeArea mobileView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CommonWidget.rowHeight(height: 43),
              Obx(() {
                return CustomToolBarWidget(
                  title: args[1],
                  rightIcon: controller.allowed.value
                      ? Icon(Icons.call, color: Cc.kPrimaryColor)
                      : null,
                  rightIconTwo: controller.allowed.value
                      ? Icon(Icons.videocam, color: Cc.kPrimaryColor)
                      : null,
                  callback: () {
                    controller.notify(
                        args[3], args[0], args[1], Message.kVOICE_CALL!);

                    Get.to(() {
                      return OutgoingCall(
                        callType: Message.kVOICE_CALL,
                        receiverName: args[1],
                        userId: args[0],
                        receiverUserId: args[3],
                      );
                    });

                    // Get.to(MyHomePage());
                  },
                  callback2: () {
                    controller.notify(
                        args[3], args[0], args[1], Message.kVIDEO_CALL!);

                    Get.to(() {
                      return OutgoingCall(
                        callType: Message.kVIDEO_CALL,
                        receiverName: args[1],
                        userId: args[0],
                        receiverUserId: args[3],
                      );
                    });
                  },
                );
              }),
              Flexible(
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                  child: Obx(() {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, index) =>
                          controller.messages.value[index],
                      itemCount: controller.messages.value.length,
                    );
                  }),
                ),
              ),
              const Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  child: TextFormField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      controller: _textController,
                      onChanged: (text) {
                        setState(() {
                          _isComposing = text.isNotEmpty;
                        });
                      },
                      // onSubmitted: _isComposing ? _handleSubmitted : null,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Cc.kPrimaryColor)),
                          focusColor: kPrimaryColor,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimaryColor,
                          )),
                          alignLabelWithHint: false,
                          floatingLabelStyle: TextStyle(
                            color: Cc.kPrimaryColor,
                          ),
                          hintText: "Send Message")),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isComposing
                      ? () async {
                          if (controller.allowed.value == false) {
                            SessionUtils.toast("No appointment",
                                "No active appointment found");
                            return;
                          }
                          _handleSubmitted(_textController.text, true,
                              DateFormat.jm().format(DateTime.now()));
                          var prefs = Get.find<SharedPreferences>();
                          var email =
                              prefs.getString(StorageConstants.userEmail)!;
                          CollectionReference reference =
                              FirebaseFirestore.instance.collection("texts");
                          var m = MessageModel(
                              dialog: args[0],
                              from: email,
                              time: DateTime.now().millisecondsSinceEpoch,
                              to: args[3],
                              text: _textController.text);
                          await reference.add(m.toJson());
                          _textController.clear();
                        }
                      : null,
                ))
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text, bool isMe, time) async {
    setState(() {
      _isComposing = false;
    });
    String userImage = args[2];
    var message = isMe
        ? SendMsgBox(
            message: text,
            animationController: _buildAnimationController(),
            image: SessionUtils.getAvatar() ?? "",
            time: time)
        : ReceiveMsgBox(
            message: text,
            animationController: _buildAnimationController(),
            image: userImage,
            time: time,
          );

    setState(() {
      controller.messages.value.insert(0, message as MsgBox);
    });

    _focusNode.requestFocus();
    (message as MsgBox).animationController.forward();

    // _isSelf = !_isSelf;
  }

  AnimationController _buildAnimationController() {
    return AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }
}
