


import 'package:bridgme/models/notification/notification_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}

class DatabaseService extends GetxService {
  Future<Box<NotificationModel>> init() async {
    await  Hive.initFlutter();
    Hive.registerAdapter(NotificationModelAdapter());
    return await Hive.openBox<NotificationModel>('notification');
  }
}

