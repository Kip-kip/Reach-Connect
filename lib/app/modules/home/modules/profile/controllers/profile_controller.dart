import 'package:bridgme/app/shared/utils/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  @override
  void onReady() {
    loadUserProfile();
    super.onReady();
  }

  var fullName = "".obs;
  var email = "".obs;
  var phone = "".obs;

  loadUserProfile(){
    fullName.value = SessionUtils.getUsername()!;
    email.value = SessionUtils.getMail()!;
    phone.value = SessionUtils.getPhone()!;
  }

}
