import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyQuestions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        width: Get.width * 1,
        height: Get.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildNavigationTiles(),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Question 1",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.normal,color: Colors.yellow),
            ),
            const Text(
              "How did you hear about us?",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.normal,color: Colors.green),
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
                    onChanged: (value) {

                    },
                    activeColor: Colors.green,
                  ),
                  const Text(
                    "From a friend?",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black),
                  ),

                ],
              ),
            ),
            SizedBox(
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
                    onChanged: (value) {

                    },
                    activeColor: Colors.green,
                  ),
                  const Text(
                    "Through social media?",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black),
                  ),

                ],
              ),
            ),
            SizedBox(
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
                    onChanged: (value) {

                    },
                    activeColor: Colors.green,
                  ),
                  const Text(
                    "Through our website?",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            _buildNextButton()

          ],
        ));
  }


  _buildNextButton(){
    return Center(
      child: SizedBox(
        width: Get.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            primary: Color(0xff006400), // backgroundound
          ),
          onPressed: () {

          },
          child: Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  _buildNavigationTiles(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.15,
          height: 10,
          decoration: BoxDecoration(
              color: Color(0xff006400)
          ),

        ),
        SizedBox(
          width: 3,
        ),
        Container(
          width: Get.width * 0.15,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          width: Get.width * 0.15,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          width: Get.width * 0.15,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey
          ),

        ),
        SizedBox(
          width: 3,
        ),
        Container(
          width: Get.width * 0.15,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey
          ),

        ),

      ],
    );
  }
}
