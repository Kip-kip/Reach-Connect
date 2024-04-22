import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/utils/utils.dart';

class CustomSilverAppBar extends StatelessWidget {
  final String appBarText;

  CustomSilverAppBar({Key? key,  this.appBarText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            goBack();
          },
          child: Icon(Icons.arrow_back_ios, color: kColorPrimary)),
      title: Text(
        appBarText,
        style: TextStyle(color: kColorPrimary),
      ),
      centerTitle: true,
    );
  }
}
