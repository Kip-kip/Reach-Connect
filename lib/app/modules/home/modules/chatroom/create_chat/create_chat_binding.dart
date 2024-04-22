import 'package:get/get.dart';

import 'create_chat_logic.dart';

class Create_chatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Create_chatLogic());
  }
}
