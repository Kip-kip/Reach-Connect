import 'package:get/get.dart';

import '../controllers/available_counsellors_logic.dart';


class AvailableCounsellorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvailableCounsellorsLogic());
  }
}
