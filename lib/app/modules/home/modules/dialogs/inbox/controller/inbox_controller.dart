import 'package:bridgme/app/controller/firebase_controller.dart';
import 'package:bridgme/app/shared/constants/storage.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/app/shared/widgets/msg/msg_box.dart';
import 'package:bridgme/models/chat/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InboxController extends GetxController {
  var loadingStatus = 0.obs;
  var messages = <MsgBox>[].obs;
  var messageLoaded = false.obs;
  var allowed = false.obs;
  var appointmentId = "".obs;

  void getAppointment(String dialogId) async {
    allowed.value = false;
    var shots = await FirebaseFirestore.instance
        .collection("appointments")
        .where('dialog', isEqualTo: dialogId)
        .where('status', whereIn: ['confirmed', 'Confirmed'])
        .where('completed', isEqualTo: false)
        // .orderBy('appointmentDate', descending: true)
        .get();
    if (shots.docs.length > 0) {
      allowed.value = true;
      appointmentId.value = shots.docs.first.id;
    }else{
      allowed.value = false;
    }
  }

  Future<void> getMessages(String dialogId, String to, callback) async {
    loadingStatus.value = 1;
    messages.clear();
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("texts");
    QuerySnapshot querySnapshot = await _collectionRef
        .where("dialog", isEqualTo: dialogId.toString())
        .orderBy('time', descending: true)
        .get();
    print("Getting messsages from " + dialogId.toString());

    var allData = querySnapshot.docs.map((doc) => doc.data()).toList().reversed;
    print("Before filter");
    print(allData.length);
    var test = allData.where((element) {
      var data = element as Map;
      print(data);
      print(dialogId);
      print(data["dialog"]);
      return data["dialog"] == dialogId;
    });
    print("After filter");
    print(test.length);

    print(allData.length);
    allData.forEach((element) {
      var data = element as Map<String, dynamic>;
      var message = MessageModel.fromJson(element);
      var isMe = (message.from != to);
      var time = DateFormat.jm()
          .format(DateTime.fromMillisecondsSinceEpoch(message.time));
      callback(message.text, isMe, time);
    });

    loadingStatus.value = 1;
    messageLoaded.value = true;
  }

  void clearCollection() async {
    var collection = FirebaseFirestore.instance.collection('appointments');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  void notify(
      String userEmail, String dialogId, String userName, String message_type) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("notifications");

    Map<String, Object> postdata = {
      "from": SessionUtils.getMail()!,
      "to": userEmail,
      "message_type": message_type,
      "username": SessionUtils.getUsername()!,
      "message": "Incoming call request",
      "dialog_id": dialogId,
    };

    reference.add(postdata).then((value) {
      // Get.to(CallsPage(
      //   receiverUserId: userEmail,
      //   userId: SessionUtils.getMail(),
      //   initiateCall: false,
      //   receiverName: userName,
      //   callType: message_type,
      // ));
    });
  }

  void watchChanges(String dialogId, String to, Function callback) {
    print("Watching changes");
    FirebaseFirestore.instance
        .collection("texts")
        .where('to', isEqualTo: SessionUtils.getMail()!)
        .where('from', isEqualTo: to)
        .orderBy('time', descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      print("We have changes");
      print("from " + to);

      var dt = data.docs.map((e) => e.data());
      data.docs.forEach((element) {
        var data = element.data();
        String text = data['text'];
        if (loadingStatus.value == 1) {
          callback(text);
        }
      });
    });
  }

  void sendNotification() {
    print("firebase sending notifications");
    FirebaseController controller = Get.find();
    controller.sendPushMessage();
  }

  AnimationController _buildAnimationController(TickerProvider tickerProvider) {
    return AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: tickerProvider,
    );
  }

  void addMessage(String dialogId, String to, String text) async {
    var prefs = Get.find<SharedPreferences>();
    var email = prefs.getString(StorageConstants.userEmail)!;
    CollectionReference reference =
        FirebaseFirestore.instance.collection("texts");
    var message = MessageModel(
        dialog: dialogId,
        from: email,
        time: DateTime.now().millisecondsSinceEpoch,
        to: to,
        text: text);
    await reference.add(message);
  }
}
