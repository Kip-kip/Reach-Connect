

import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/components/auth_header/wave_header.dart';

import '../../../../../shared/constants/constants.dart';
import 'survey_intro_logic.dart';

class SurveyIntroPage extends StatelessWidget {
  final logic = Get.put(SurveyIntroLogic());
  final state = Get.find<SurveyIntroLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: Get.width * 1,
            height: Get.height * 0.25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const WaveHeader(
              title: '',
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              width: Get.width * 1,
              height: Get.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                    child: Text(
                      "Your opinion in 3 minutes",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff006400)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                    child: Text(
                      "By answering this 3 minute survey, you help us improve our service even better for you",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTakeSurveyButton()
                ],
              ))
        ],
      ),
    );
  }

  _buildTakeSurveyButton() {
    return Center(
      child: SizedBox(
        width: Get.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            primary: kColorGreen, // backgroundound
          ),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.SURVEY_QUESTIONS);
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Take the survey",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
