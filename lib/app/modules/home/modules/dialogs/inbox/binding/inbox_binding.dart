import 'package:bridgme/app/modules/home/modules/dialogs/inbox/controller/inbox_controller.dart';
import 'package:get/get.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>InboxController());
  }
}
