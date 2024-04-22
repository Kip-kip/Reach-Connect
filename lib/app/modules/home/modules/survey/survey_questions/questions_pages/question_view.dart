import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/models/survey/survey_question.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class QuestionView extends StatelessWidget {
  final PageController pagerController;
  final SurveyQuestion surveyQuestion;
  final int totalQuestions;

  const QuestionView({
    Key? key,
    required this.pagerController,
    required this.surveyQuestion,
    required this.totalQuestions,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
             alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width * 1,

              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Question ${surveyQuestion.number.toString()}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow),
                  ),
             Text(
                    "${surveyQuestion.question}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.green),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: surveyQuestion.options!.length,
                      itemBuilder: (question, index){
                    return   Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: 1,
                            onChanged: (value) {},
                            activeColor: Colors.green,
                          ),
                          const Text(
                            "From a friend?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                  },),
              SizedBox(
                height: 10,),
                 totalQuestions==surveyQuestion.number?_buildSaveButton(): _buildNextButton()
                ],
              ))
        ],
      ),
    );
  }

  _buildNextButton() {
    return Center(
      child: SizedBox(
        width: Get.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            primary: Cc.wantedGreen // backgroundound
          ),
          onPressed: () {
            pagerController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  _buildSaveButton() {
    return Center(
      child: SizedBox(
        width: Get.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              primary: Cc.wantedGreen // backgroundound
          ),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.HOME);
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Save",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
