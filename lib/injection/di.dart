
import 'package:get/get.dart';
import '../app/controller/firebase_controller.dart';
import '../app/controller/storage_controller.dart';

import '../app/modules/home/modules/notification/controllers/notification_logic.dart';
import '../app/shared/services/storage_service.dart';


class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => DatabaseService().init());
    Get.put(StorageController());
    Get.put(NotificationLogic());
    Get.put(FirebaseController());

  }
}
