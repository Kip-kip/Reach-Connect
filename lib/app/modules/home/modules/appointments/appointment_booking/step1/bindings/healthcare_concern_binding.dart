import 'package:get/get.dart';

import '../controllers/healthcare_concern_logic.dart';

class HealthcareConcernBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthcareConcernLogic());
  }
}
