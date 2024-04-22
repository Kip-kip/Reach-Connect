import 'package:bridgme/app/shared/services/services.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;

  bool get isLoggedInValue => SessionUtils.getMail() != null;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
