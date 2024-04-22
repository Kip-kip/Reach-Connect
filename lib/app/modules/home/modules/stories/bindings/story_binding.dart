
import 'package:get/get.dart';

import '../controllers/story_logic.dart';

class StoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryLogic());
  }
}
