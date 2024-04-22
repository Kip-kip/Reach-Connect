import 'package:get/get.dart';

import 'chatroom_logic.dart';

class ChatroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatroomLogic());
  }
}
