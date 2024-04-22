


import 'package:get/get.dart';
import '../controllers/edit_profile_logic.dart';



class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileLogic());
  }
}
