import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cc {
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color wantedGreen = Color(0xFF6AC259);
  static Color hombBG = hexToColor('#fafafa');
  static Color kPrimaryColor =  const Color(0xFF6AC259);
  static const kPrimaryLightColor = Color(0xFFc6d9ff);
  static const lightGrey = Color.fromRGBO(0, 0, 0, 0.4);
  static const defaultTextColor = Color.fromRGBO(0, 0, 0, 0.7);

  static void showInSnackBar(String value, BuildContext context) {
    if(Get.context != null){
      Scaffold.of(Get.context!).showSnackBar(new SnackBar(content: new Text(value)));
    }

  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
