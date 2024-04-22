import 'package:flutter/material.dart';

import '../constants/colors.dart';

InputDecoration getInputDecorationy(String label) {
  return InputDecoration(
      hintStyle: TextStyle(
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Cc.kPrimaryColor)),
      focusColor: Cc.kPrimaryColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cc.kPrimaryColor,
          )),
      floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),
      alignLabelWithHint: true,
      hintText: label);
}

InputDecoration getInputDecorationx(String label) {
  return InputDecoration(
      hintStyle: TextStyle(fontSize: 12),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Cc.kPrimaryColor)),
      focusColor: Cc.kPrimaryColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cc.kPrimaryColor,
          )),
      floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),

      hintText: label);
}

InputDecoration getInputDecoration(String label) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Cc.kPrimaryColor)),
      focusColor: Cc.kPrimaryColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cc.kPrimaryColor,
          )),
      floatingLabelStyle: TextStyle(color: Cc.kPrimaryColor),
      labelText: label,
      hintText: label);
}