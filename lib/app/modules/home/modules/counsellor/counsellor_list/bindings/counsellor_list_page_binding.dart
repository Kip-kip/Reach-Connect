
import 'package:get/get.dart';

import '../controllers/counsellor_list_logic.dart';

class CounsellorListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounsellorListLogic());
  }
}
