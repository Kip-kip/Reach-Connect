
import 'package:get/get.dart';

import '../controllers/counsellor_profile_logic.dart';

class CounsellorProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounsellorProfileLogic(Get.rootDelegate.parameters['therapistId'] ?? ''));
  }
}
