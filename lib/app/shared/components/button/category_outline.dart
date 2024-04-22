import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryOutline extends StatelessWidget {
  final String text;


  const CategoryOutline({
    Key? key,
    required this.text,

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
        onPressed: (){},
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
