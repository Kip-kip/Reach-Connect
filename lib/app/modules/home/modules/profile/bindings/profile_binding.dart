import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
