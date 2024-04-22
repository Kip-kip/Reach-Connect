import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/constants/colors.dart';
import 'app/shared/constants/constants.dart';
import 'app/shared/services/boxex.dart';
import 'injection/di.dart';
import 'models/notification/notification_model.dart';
import 'services/auth_service.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  var notification = message.notification;
  var android = message.notification?.android;
  var box = Get.find<Box<NotificationModel>>();
  if (box == null) {
    await DenpendencyInjection.init();
  }

  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            '4578',
            'bridgme',
            icon: 'launch_background',
          ),
        ),
        payload: "1234567");
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
      // });
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
      // Get.to(() {
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
}

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  messagingInt();
  await DenpendencyInjection.init();
  runApp(
    GetMaterialApp.router(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(
        () {
          // Get.put(StorageService());
          Get.put(AuthService());
        },
      ),
      getPages: AppPages.routes,
      theme: ThemeData(
          primaryColor: Cc.kPrimaryColor,
          brightness: Brightness.light,
          fontFamily: 'NunitoSans',
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: Cc.kPrimaryColor,
          ),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          // textSelectionTheme:
          // TextSelectionThemeData(cursorColor: Cc.kPrimaryColor),
          colorScheme: ColorScheme.light(
                  primary: kColorPrimary, primaryVariant: kColorPrimary)
              .copyWith(secondary: kColorPrimary),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: kColorPrimary)),
      // routeInformationParser: GetInformationParser(
      //     // initialRoute: Routes.HOME,
      //     ),
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.History,
      //   preventDuplicateHandlingMode:
      //       PreventDuplicateHandlingMode.ReorderRoutes,
      // ),
    ),
  );
}

void messagingInt() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  localNotificationInit();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got firebase message whilst in the foreground!');
    print('Message data: ${message.data}');

    var notification = message.notification;
    var android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            '4578',
            'bridge me',
            icon: 'launch_background',
          ),
        ),
        payload: json.encode(message.data),
      );
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
        // });
      }
      if (message.data["mtype"] == "MESSAGE") {
        // var model = NotificationModel(
        //     title: message.data["title"],
        //     text: message.data["text"],
        //     image: message.data["image"],
        //     time: DateTime.now().millisecondsSinceEpoch);
        // Boxes.getNotification().add(model);
      }
      if (message.data["mtype"] == "APPOINTMENT") {
        // var model = NotificationModel(
        //     title: message.data["title"],
        //     text: message.data["message"],
        //     image: message.data["image"],
        //     time: DateTime.now().millisecondsSinceEpoch);
        // Boxes.getNotification().add(model);
      }

      if (message.data["mtype"] == "LIVE") {
        // var model = NotificationModel(
        //     title: message.data["title"],
        //     text: message.data["message"],
        //     image: message.data["image"],
        //     time: DateTime.now().millisecondsSinceEpoch);
        // Boxes.getNotification().add(model);
      }

      if (message.data["mtype"] == "VIDEO_CALL") {
        // Get.to(() {
        //   return Meeting(
        //     receiverUserId: message.data['user'],
        //     userId: message.data['id'],
        //     initiateCall: true,
        //     receiverName: message.data['user_name'] ?? "",
        //     callType: "VIDEO_CALL",
        //   );
        // });
      }
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');

    if (message.data.containsKey('message_type')) {}
  });
}

Future<void> localNotificationInit() async {
  const initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {});
  final initializationSettingsMacOS = MacOSInitializationSettings();
  final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (payload) {
    print("Payload x $payload");
    //  Get.to(NotificationScreen());
  });
}
