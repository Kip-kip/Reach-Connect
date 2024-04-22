
import 'package:get/get.dart';

import '../controllers/appointment_detail_logic.dart';


class AppointmentDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentDetailLogic(Get.rootDelegate.parameters["appointmentId"]));
  }
}
