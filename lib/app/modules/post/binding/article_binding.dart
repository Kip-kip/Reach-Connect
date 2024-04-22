import 'package:bridgme/app/modules/post/controllers/article_controller.dart';
import 'package:get/get.dart';

class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController(Get.rootDelegate.parameters['categoryId'] ?? ''));
  }
}
