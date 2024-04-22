import 'package:flutter/material.dart';

class WeightedText extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  FontWeight? fontWeight = FontWeight.w500;
  double? textSize=14;

  WeightedText({
    Key? key,
    required this.text,
    this.onPressed,
    this.textSize,
    this.fontWeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(text,
        style: TextStyle(color: Colors.black45, fontSize: textSize, fontWeight:fontWeight), ),
    );
  }
}
