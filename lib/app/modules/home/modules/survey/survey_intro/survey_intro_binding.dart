

import 'package:get/get.dart';

import 'survey_intro_view.dart';

class SurveyIntroPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyIntroPage());
  }
}
