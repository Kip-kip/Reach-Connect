import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionFour extends StatelessWidget {
  const QuestionFour({Key? key}) : super(key: key);

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
                    "Question 4",
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
}
