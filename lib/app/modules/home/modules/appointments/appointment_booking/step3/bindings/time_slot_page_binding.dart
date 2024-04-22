import 'package:get/get.dart';

import '../controllers/time_slot_logic.dart';

class TimeSlotPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => TimeSlotLogic(Get.rootDelegate.parameters["therapistId"]));
  }
}
