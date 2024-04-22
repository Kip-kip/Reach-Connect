import 'package:get/get.dart';

import 'dialogs_logic.dart';

class DialogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DialogsLogic());
  }
}
