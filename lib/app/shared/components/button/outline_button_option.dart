import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutlineButtonOption extends StatelessWidget {
  final String text;
  final int outlineColour;
  final String iconPath;
  final void Function() onPressed;
  final double elevation;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? textSize;

  const OutlineButtonOption({
    Key? key,
    required this.text,
    required this.outlineColour,
    this.iconPath = "",
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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          primary: Colors.white, // backgroundound
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('${iconPath}',height: 20,),
              const SizedBox(width: 10,),
              Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
