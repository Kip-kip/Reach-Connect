import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionThree extends StatelessWidget {
  final PageController pagerController;

  const QuestionThree({
    Key? key,
    required this.pagerController,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              width: Get.width * 1,
              height: Get.height * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Question 3",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow),
                  ),
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
            primary: const Color(0xff006400), // backgroundound
          ),
          onPressed: () {},
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

}
