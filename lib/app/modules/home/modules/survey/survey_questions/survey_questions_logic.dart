import 'package:bridgme/app/modules/home/modules/survey/survey_questions/survey_questions_state.dart';
import 'package:bridgme/models/survey/survey_question.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';


class SurveyQuestionsLogic extends GetxController {
  final SurveyQuestionsState state = SurveyQuestionsState();

  var tileNavigator = 0.obs;
  @Collection<SurveyQuestion>('survey_questions')
  final surveyQuestionsRef = SurveyQuestionCollectionReference();
  var questions = <SurveyQuestion>[].obs;

  @override
  void onInit() {
    // createDummyQns();
    getQuestions();
    super.onInit();
  }

  void pageSwiped(index){
    tileNavigator.value = index;
  }

  getQuestions() {
    questions.bindStream(surveyQuestionsRef
        .orderByNumber(descending: false)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }
  void createDummyQns(){
    var qn= SurveyQuestion();
    qn.number=8;
    qn.question="Where did you hear about us? ";
    qn.options=["From a friend?", "From the web?", "From our website?"];
    surveyQuestionsRef.add(qn);

    // qn= SurveyQuestion();
    // qn.number=1;
    // qn.question="Where did you hear about us?";
    // qn.options=["From a friend?", "From the web?", "From our website?"];
    // surveyQuestionsRef.add(qn);
    //
    //  qn= SurveyQuestion();
    // qn.number=1;
    // qn.question="Where did you hear about us?";
    // qn.options=["From a friend?", "From the web?", "From our website?"];
    // surveyQuestionsRef.add(qn);
    //
    // qn= SurveyQuestion();
    // qn.number=1;
    // qn.question="Where did you hear about us?";
    // qn.options=["From a friend?", "From the web?", "From our website?"];
    // surveyQuestionsRef.add(qn);
  }
}
