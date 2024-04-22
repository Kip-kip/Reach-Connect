import 'package:get/get.dart';

import '../controllers/chatroom_details_logic.dart';

class ChatroomDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatroomDetailsLogic());
  }
}
