import 'package:bridgme/app/modules/home/controllers/profile_controller.dart';
import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  AuthService authService = Get.find();
  var fullName = "".obs;
  var userEmail = "".obs;
  var currentLocation = "".obs;
  var isHomePage = true.obs;

  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpen = false.obs;

  @override
  void onInit() {
    watchRouting();
    if (!AuthService.to.isLoggedInValue) {
      // navigateToLogin();
    } else {
      populateProfile();
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (SessionUtils.getMail() == null || SessionUtils.getMail()!.isEmpty) {
      UserProfileController _profileController =
          Get.put(UserProfileController());
      _profileController.signOut();
      Get.rootDelegate.toNamed(Routes.LOGIN);
    }
    super.onReady();
  }

  void watchRouting() {
    Get.rootDelegate.addListener(() {
      String title = Get.rootDelegate.history.last.currentPage?.name ?? "";

      if (title == "/") {
        isHomePage.value = true;
      } else if (title == Routes.HOME) {
        isHomePage.value = true;
      } else if (title == Routes.DASHBOARD) {
        isHomePage.value = true;
      } else if (title == Routes.PROFILE) {
        isHomePage.value = true;
      } else if (title == Routes.CHAT_DIALOGS) {
        isHomePage.value = true;
      } else if (title == Routes.CHATROOM) {
        isHomePage.value = true;
      } else {
        isHomePage.value = false;
      }
    });
  }

  void check() {
    var title = currentLocation.value;
    if (title == "/") {
      isHomePage.value = true;
    } else if (title == Routes.HOME) {
      isHomePage.value = true;
    } else if (title == Routes.DASHBOARD) {
      isHomePage.value = true;
    } else if (title == Routes.PROFILE) {
      isHomePage.value = true;
    } else if (title == Routes.CHAT_DIALOGS) {
      isHomePage.value = true;
    } else if (title == Routes.CHATROOM) {
      isHomePage.value = true;
    } else {
      isHomePage.value = false;
    }
  }

  void navigateToLogin() {
    Get.rootDelegate.toNamed(Routes.LOGIN);
  }

  void populateProfile() {
    fullName.value = SessionUtils.getUsername() ?? "No username";
    userEmail.value = SessionUtils.getMail() ?? "No email";
  }
}
