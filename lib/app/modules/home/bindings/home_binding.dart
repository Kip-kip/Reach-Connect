import 'package:bridgme/app/modules/home/modules/chatroom/chatroom_logic.dart';
import 'package:bridgme/app/modules/home/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bridgme/app/modules/home/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );

    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
    Get.lazyPut<ChatroomLogic>(
          () => ChatroomLogic(),
    );

  }
}
