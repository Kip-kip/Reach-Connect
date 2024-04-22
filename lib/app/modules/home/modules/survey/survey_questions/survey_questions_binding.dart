
import 'package:bridgme/app/modules/home/modules/survey/survey_questions/survey_questions_view.dart';
import 'package:get/get.dart';

class SurveyQuestionsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyQuestionsPage());
  }
}
