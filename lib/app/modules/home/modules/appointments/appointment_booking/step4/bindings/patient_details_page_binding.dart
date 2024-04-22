import 'package:get/get.dart';

import '../controllers/patient_details_logic.dart';

class PatientDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => PatientDetailsLogic(Get.rootDelegate.parameters["therapistId"]));
  }
}
