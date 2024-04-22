import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilityButton extends StatelessWidget {
  final String text;
  final int colour;
  final void Function() onPressed;
  final double elevation;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? textSize;

  const UtilityButton({
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
    return Center(
      child: SizedBox(
        width: Get.width * 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            primary: Color(colour), // backgroundound
          ),
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
