

import 'package:get/get.dart';

import '../controllers/journals_details_logic.dart';




class JournalsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JournalsDetailsLogic(Get.rootDelegate.parameters['postId'] ?? ''));
  }
}
