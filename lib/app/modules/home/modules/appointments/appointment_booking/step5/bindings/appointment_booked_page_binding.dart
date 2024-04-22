
import 'package:get/get.dart';

import '../controllers/appointment_booked_logic.dart';

class AppointmentBookedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentBookedLogic());
  }
}
