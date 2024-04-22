import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionTwo extends StatelessWidget {
  final PageController pagerController;

  const QuestionTwo({
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
                    height: 20,
                  ),
                  const Text(
                    "Question 2",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow),
                  ),
                  const Text(
                    "How would you like our team to help you?",
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
                          activeColor: Colors.green,
                        ),
                        const Text(
                          "Individual counselling?",
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
                          "Group counselling?",
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
                          "Referral service?",
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
                borderRadius:  BorderRadius.circular(10.0)),
            primary: Cc.wantedGreen, // backgroundound
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
