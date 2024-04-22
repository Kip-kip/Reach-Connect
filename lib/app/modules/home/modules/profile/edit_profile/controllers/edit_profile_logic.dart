import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../models/user/user_model_entity.dart';
import '../../../../../../shared/constants/storage.dart';
import '../../../../../../shared/utils/session.dart';

class EditProfileLogic extends GetxController {
  var dob = 0.obs;
  var gender = "Male".obs;
  var userModel = UserModelEntity(
    isConsultant: 0,
    activated: 1,
    id: "",
    fullname: SessionUtils.getUsername() ?? "",
    email: SessionUtils.getMail() ?? "",
    gender: SessionUtils.getGender() ?? "",
    phone: SessionUtils.getPhone() ?? "",
    dob: SessionUtils.getDOB() ?? 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    loadProfile(SessionUtils.getMail()!);
  }

  void storeProfile(UserModelEntity user) async {
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.username, user.fullname ?? "");
    prefs.setString(StorageConstants.userEmail, user.email ?? "");
    prefs.setString(StorageConstants.userGender, user.gender ?? "");
    prefs.setString(StorageConstants.phone, user.phone ?? "");
    prefs.setInt(StorageConstants.userDob, user.dob ?? 0);
  }

  loadProfile(String email) {
    userModel.bindStream(userModelEntityRef
        .whereEmail(isEqualTo: email)
        .snapshots()
        .map((event) => event.docs
            .map((e) {
              var model = e.data;
              model.id = e.id;
              return model;
            })
            .toList()
            .first));
  }

  void updateBirthDate(DateTime date) {
    dob.value = date.millisecondsSinceEpoch;
    userModel.value.dob = date.millisecondsSinceEpoch;
  }

  void updateGender(userGender) {
    gender.value = userGender;
  }

  void updateProfile(String fullName, String contactNumber, String email) {
    userModel.value.fullname = fullName;
    userModel.value.phone = contactNumber;
    userModel.value.dob = dob.value;
    userModel.value.gender = gender.value;
    userModelEntityRef.doc(userModel.value.id).set(userModel.value);
    storeProfile(userModel.value);
  }
}
