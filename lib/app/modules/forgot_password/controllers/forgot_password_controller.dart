import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/utils/session.dart';

class ForgotPasswordController extends GetxController {
  forgotPassword(TextEditingController email) {
    resetPassword(email);
  }

  void resetPassword(TextEditingController registerEmailController) async {
    try {
      if (registerEmailController.text.isEmpty) {
        SessionUtils.toast("Required", "Email required");
        return;
      }
      FirebaseAuth _auth = FirebaseAuth.instance;
      var result = await _auth.sendPasswordResetEmail(
          email: registerEmailController.text.trim());
      SessionUtils.toast("Success", "Password reset link sent to your email ");
      registerEmailController.clear();
    } catch (e) {
      SessionUtils.warn("Error",
          "Failed to send reset link check your email addresss and try again");
    }
  }
}
