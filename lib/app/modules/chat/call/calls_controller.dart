import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/constants/base_constants.dart';
import '../../../shared/constants/storage.dart';

class CallsController extends GetxController {
  var offer = "".obs;
  var answer = "".obs;
  var candidate = "".obs;
  var isMute = false.obs;
  var isLoudSpeaker = false.obs;
  var isVideo = false.obs;
  var isInCall = false.obs;
  var isRinging = false.obs;
  var isAccepted = false.obs;
  var callStatusMessage = "Outgoing call".obs;
  var callTo = "".obs;
  var callStarted = false.obs;

  void watchFirestore(Function callback) {
    var prefs = Get.find<SharedPreferences>();
    var userId = prefs.getString(StorageConstants.userEmail);
    var databaseReference = FirebaseFirestore.instance;
    if (userId != null) {
      databaseReference
          .collection(Constants.kUsersCollection)
          .where('to', isEqualTo: userId.trim())
          .snapshots()
          .listen((data) {
        for (var change in data.docs) {
          Map data = change.data();
          if (data.containsKey("to")) {
            print("Sending to");
            print(data["to"]);
            if (data["to"] == userId.trim()) {
              callback(data);
            } else {
              print("its not mine");
              print(userId);
            }

            print(
                'Document Change Controller documentChanges ${change.data()}');
          }
        }
      });
    }
  }
}
