import 'package:get/get.dart';

import '../controllers/filter_logic.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterLogic());
  }
}
