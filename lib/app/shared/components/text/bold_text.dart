
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  double? textSize = 14;
  Color? textColor = Cc.defaultTextColor;

  BoldText({
    Key? key,
    required this.text,
    this.onPressed,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(text,
        style: TextStyle(color:textColor, fontSize: textSize, fontWeight: FontWeight.bold), ),
    );
  }
}
