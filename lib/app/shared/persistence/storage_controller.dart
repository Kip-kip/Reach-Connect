import 'dart:convert';


import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/notification/notification_entity.dart';


class StorageController extends GetxController {
  late final SharedPreferences sharedPref;
  late final Box box;

  StorageController();

  @override
  void onInit() async {
    this.sharedPref = Get.find<SharedPreferences>();
    this.box = Get.find<Box<NotificationEntity>>();
    super.onInit();
  }

  saveBoolean(String key, bool value) {
    this.sharedPref.setBool(key, value);
  }

  clear() {
    this.sharedPref.clear();
  }

  Box getBox() {
    return this.box;
  }

  getBoolean(String key) {
    return sharedPref.getBool(key) == null ? false : sharedPref.getBool(key);
  }

  String? getString(String key) {
    return sharedPref.getString(key) == null ? "" : sharedPref.getString(key);
  }

  String? getStringWithDefault(String key, String defaultText) {
    return sharedPref.getString(key) == null
        ? defaultText
        : sharedPref.getString(key);
  }

  saveString(String key, String value) {
    sharedPref.setString(key, value);
  }

  saveMap(String key, Map map) {
    sharedPref.setString(key, json.encode(map));
  }

  Map getStoredMap(String key, Map map) {
    var mapString = sharedPref.getString(key);
    if (mapString == null) {
      return map;
    }
    return json.decode(mapString) as Map<dynamic,dynamic>;
  }
}
