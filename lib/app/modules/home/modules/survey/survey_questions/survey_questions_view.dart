import 'package:bridgme/app/modules/home/modules/survey/survey_questions/questions_pages/question_view.dart';
import 'package:bridgme/app/shared/components/auth_header/wave_header.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'survey_questions_logic.dart';

class SurveyQuestionsPage extends StatelessWidget {
  final logic = Get.put(SurveyQuestionsLogic());
  final state = Get.find<SurveyQuestionsLogic>().state;
  final PageController controller = PageController(initialPage: 0);

  final _questionsController = Get.put(SurveyQuestionsLogic());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(

              height: Get.height * 0.25,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const WaveHeader(
                title: '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: _buildNavigationTiles(),

                height: 20,
              ),
            ),
            Obx(() {
              if (_questionsController.questions.isEmpty) {
                return Container(
                  height: Get.height * 0.5,
                  child: Center(
                    child: Text("No Survery question for you"),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.topLeft,

                  height: Get.height * 0.7,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        _questionsController.pageSwiped(index);
                      },
                      children: _questionsController.questions.map((element) {
                        return Container(

                          child: QuestionView(
                            pagerController: controller,
                            surveyQuestion: element,
                            totalQuestions: _questionsController.questions.length,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  _buildNavigationTiles() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _questionsController.questions.map((element) {
            return Container(
              height: 10,
              width: Get.width * 0.7 / _questionsController.questions.length,
              margin: EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                  color: element.number ==
                          _questionsController.tileNavigator.value + 1
                      ? Cc.wantedGreen
                      : Colors.grey),
            );
          }).toList(),
        ),
      );
    });
  }
}
