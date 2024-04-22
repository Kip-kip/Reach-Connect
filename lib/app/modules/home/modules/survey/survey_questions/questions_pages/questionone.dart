import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class QuestionOne extends StatelessWidget {
  final PageController pagerController;

  const QuestionOne({
    Key? key,
    required this.pagerController, 
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              width: Get.width * 1,
              height: Get.height * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Question 1",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: kColorGreen),
                  ),
                  const Text(
                    "How did you hear about us?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.green),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                          activeColor: kColorGreen,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
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
                          "Through social media?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
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
                          "Through our website?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  _buildNextButton()
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
}
