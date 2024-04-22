import 'package:get/get.dart';

import '../controllers/notification_logic.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationLogic());
  }
}
