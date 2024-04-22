import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../modules/login/controllers/login_controller.dart';

class PrimaryButtonOption extends StatelessWidget {
  final loginController = Get.put(LoginController());

  final String text;
  final Color colour;
  final Function() onPressed;
  final double elevation;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? textSize;

  PrimaryButtonOption({
    Key? key,
    required this.text,
    required this.colour,
    required this.onPressed,
    this.elevation = 0,
    this.borderRadius = 4,
    this.padding,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          primary: colour, // backgroundound
        ),
        onPressed: onPressed
        ,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Obx(() {
            return !loginController.isLoading.value ? Text(
              text,
              style: TextStyle(fontSize: 16),
            ):
            Column(
              children: [
                JumpingText('loading...'),
              ],
            );
          }),
        ),
      ),
    );
  }
}
