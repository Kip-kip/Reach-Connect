import 'package:get/get.dart';

import '../controllers/choose_doctor_logic.dart';


class ChooseDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseDoctorLogic(Get.rootDelegate.parameters['categoryId'] ?? ''));
  }
}
