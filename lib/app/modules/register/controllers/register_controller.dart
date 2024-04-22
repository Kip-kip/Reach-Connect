import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/utils/common_widget.dart';
import '../../../shared/utils/focus.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerUsernameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = true;

  void createUser(String fullname, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    var userdata = <String, String>{
      "username": fullname.removeAllWhitespace,
      "email": email,
      "fullname": fullname,
      "gender": selectedGender.value,
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference
          .add(userdata)
          .then((value) => Get.rootDelegate.offAndToNamed(Routes.LOGIN));
    }).catchError(
      (onError) => Get.snackbar(
          "Error while creating account", onError.message as String,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }
    }
  }

  final selectedGender = "Female".obs;

  updateGender(String genderUpdate) {
    selectedGender.value = genderUpdate;
  }

  registerUser(
      String fullName, String email, String password) {
      createUser(fullName, email.trim().trimRight(), password.trim());
  }
}
