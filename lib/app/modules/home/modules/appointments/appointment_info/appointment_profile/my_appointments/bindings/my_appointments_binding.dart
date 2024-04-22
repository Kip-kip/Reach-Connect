import 'package:get/get.dart';

import '../controllers/my_appointments_logic.dart';


class MyAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppointmentsLogic());
  }
}
