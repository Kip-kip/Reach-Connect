
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user/user_model_entity.dart';
import '../constants/base_constants.dart';
import '../constants/colors.dart';
import '../constants/storage.dart';
import '../persistence/storage_controller.dart';


class SessionUtils {
  final StorageController controller;
  static const USER_DATA = "USER_DATA";

  SessionUtils(this.controller);

  // UserModelEntity? getUserData() {
  //   var userdata = controller.getStoredMap(Constants.kUser, {}) as Map<String, dynamic>;
  //   if (userdata == null) {
  //     return null;
  //   }
  //   return   UserModelEntity() ;
  // }

  static String getAvatarLink(String email) {
    var encoded = Uri.encodeFull(email);
    return "https://firebasestorage.googleapis.com/v0/b/maple-ke.appspot.com/o/tulivu_dp%2F$encoded?alt=media&token=f8a23099-4c52-421b-aa60-dab92d80e974";
  }

  String? getEmail() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userEmail);
    // return "mfalme@gmail.com";
  }

  static String? getTherapistId() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.therapistId);
  }

  void persistUser(UserModelEntity user) {
    // controller.saveMap(Constants.kUser, user.toJson());
    controller.saveBoolean(Constants.kIsLoggedIn, true);
  }

  static String? getMail() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userEmail);
    // return "mfalme@gmail.com";
  }

  static String? getUsername() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.username);
  }

  static String? getPhone() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.phone);
  }

  static String? getGender() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userGender);
  }

  static int? getDOB() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getInt(StorageConstants.userDob);
  }

  static String? getBloodGroup() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userBloodGroup);
  }

  static String? getMaritalStatus() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userMaritalStatus);
  }

  static String? getHeight() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userHeight);
  }

  static String? getWeight() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userWeight);
  }

  static String? getEmergencyContact() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userEmergencyContact);
  }

  static String? getLocation() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.userLocation);
  }

  static void storeToken(String token) {
    final prefs = Get.find<SharedPreferences>();
    prefs.setString("token", token);
  }

  static String? getToken() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString("token");
  }

  static String? getAvatar() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getString(StorageConstants.displayPicture);
    // return "mfalme@gmail.com";
  }

  static Container ImagePlaceholder() {
    return Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.black12, width: 0.5),
          image: DecorationImage(
              image: AssetImage('assets/images/avatar60.jpeg'),
              fit: BoxFit.cover),
        ));
  }

  static void toast(String title, String message) {
    Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
        backgroundColor: Colors.blueGrey,
        colorText: Colors.white

    );
  }

  static void iconToast(String title, String message, IconData iconData) {
    Get.snackbar(title, message,
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
        backgroundColor: Cc.kPrimaryColor,
        colorText: Colors.white);
  }

  static void warn(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.info_outlined,
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
        backgroundColor: Colors.grey,
        colorText: Colors.white);
  }

  static void success(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.check_circle_outlined,
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
        backgroundColor: Cc.kPrimaryColor,
        colorText: Colors.white);
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void info(String s, String t) {
    Get.snackbar(s, t,
        margin: EdgeInsets.only(top: 20, left: 16, right: 16),
        shouldIconPulse: true,
        showProgressIndicator: false,
        icon: Icon(
          Icons.info_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
        colorText: Colors.white);
  }
}
