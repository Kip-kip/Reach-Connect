import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/constants/colors.dart';
import 'package:bridgme/app/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class QuestionFive extends StatelessWidget {
  const QuestionFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              width: Get.width * 1,
              height: Get.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Question 5",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow),
                  ),
                  CommonWidget.rowHeight(height: Get.height * .4),
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
            primary: Cc.wantedGreen, // backgroundound
          ),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.HOME);
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Save",
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
