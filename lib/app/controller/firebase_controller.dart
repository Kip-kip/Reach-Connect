import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../models/notification/notification_model.dart';
import '../shared/services/boxex.dart';
import '../shared/utils/session.dart';

class FirebaseController extends GetxController {
  String? _token;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;

  @override
  void onInit() async {
    super.onInit();
    await localNotificationInit();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("New message");
        print(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var notification = message.notification;
      var android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            "Payload testing",
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                '4578',
                'tulivu',
                icon: 'launch_background',
              ),
            ),
            payload: "12367989");
      }

      if (message.data.containsKey('mtype')) {
        if (message.data["mtype"] == "VOICE_CALL") {
          // Get.to(() {
          //   return Meeting(
          //     receiverUserId: message.data['user'],
          //     userId: message.data['id'],
          //     initiateCall: true,
          //     receiverName: message.data['user_name'] ?? "",
          //     callType: "VOICE_CALL",
          //   );
          // }
          // );
        }

        if (message.data["mtype"] == "MESSAGE") {
          var model = NotificationModel(
              title: message.data["title"] as String?,
              text: message.data["text"] as String?,
              image: message.data["image"] as String?,
              time: DateTime.now().millisecondsSinceEpoch);
          Boxes.getNotification().add(model);
        }
        if (message.data["mtype"] == "APPOINTMENT") {
          var model = NotificationModel(
              title: message.data["title"] as String?,
              text: message.data["text"] as String?,
              image: message.data["image"] as String?,
              time: DateTime.now().millisecondsSinceEpoch);
          Boxes.getNotification().add(model);
        }

        if (message.data["mtype"] == "LIVE") {
          var model = NotificationModel(
              title: message.data["title"] as String?,
              text: message.data["message"] as String?,
              image: message.data["image"] as String?,
              time: DateTime.now().millisecondsSinceEpoch);
          Boxes.getNotification().add(model);
        }

        if (message.data["mtype"] == "VIDEO_CALL") {
          // Get.to( () {
          //   return Meeting(
          //     receiverUserId: message.data['user'],
          //     userId: message.data['id'],
          //     initiateCall: true,
          //     receiverName: message.data['user_name'] ?? "",
          //     callType: "VIDEO_CALL",
          //   );
          // });
        }

        if (message.data["mtype"] == "APPOINTMENT") {
          // AppointmentModel.fromJson(message.data);
        }
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    firebaseGetToken();
  }

  Future<void> localNotificationInit() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final initializationSettingsMacOS = MacOSInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void storeNotification() {}

  void firebaseGetToken() async {
    FirebaseMessaging.instance.subscribeToTopic('Live');
    if (kIsWeb) {
      var token = await FirebaseMessaging.instance.getToken(
              vapidKey:
                  "BAeG-Xmt-5k3wLOJh2tqQF-nFWYSI3b8Btw_b93dmMMCF40lgj6Kg18Sf_OOipAzyD8jFjfCkTpR8Vxe42UdnV0") ??
          "Not found";
      print("Token ==>" + token);

      if (token != null) {
        SessionUtils.storeToken(token);
      }
    } else {
      var token = await FirebaseMessaging.instance.getToken() ?? "Not found";
      print("Token ==>" + token);

      if (token != null) {
        SessionUtils.storeToken(token);
      }
    }
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }

  Future<void> sendPushMessage() async {
    _token = SessionUtils.getToken();
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test".');
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.');
        }
        break;
      case 'unsubscribe':
        {
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".');
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.');
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
                'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
          }
        }
        break;
      default:
        break;
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}

  void selectNotification(String? payload) {
    if (payload != null && payload.length > 0) {
      print(payload);
      // Map<String, dynamic> data = json.decode(payload)!;
      // if (data.containsKey('mtype')) {
      //   if (data["mtype"] == "LIVE") {
      //     String roomName = data["link"];
      //     String doctorEmail = data['image'];
      //     Get.to(() {
      //       return JoinLive(
      //         roomName: roomName,
      //         receiverName: "Attendee",
      //         doctorEmail: doctorEmail,
      //       );
      //     });
      //   }else{
      //     print("Not Message");
      //   }
      // }else{
      //   print("Not contain mtype");
      // }
    } else {
      print("Payload is empty");
    }
  }
}
