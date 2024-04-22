import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarText;

  CustomAppBar({Key? key,  this.appBarText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: GestureDetector(
          onTap: () {
            goBack();
          },
          child: Icon(Icons.arrow_back_ios_rounded, color: kColorPrimary)),
      title: Text(
        appBarText,
        style: TextStyle(color: kColorPrimary,fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}


class CustomAppBar2 extends StatelessWidget {
  final String appBarText;

  CustomAppBar2({Key? key,  this.appBarText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
           goBack();
          },
          child: Icon(Icons.close, color: kColorPrimary)),
      title: Text(
        appBarText,
        style: TextStyle(color: kColorPrimary,fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}

