
import 'package:flutter/material.dart';

import '../constants/colors.dart';


class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color color;
  final double fontSize;
  final bool password;
  final Icon? icon;
  final String? Function(String?)? validator;

  InputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeholder = '',
    this.color = Colors.white,
    this.fontSize = 14.0,
    this.password = false,
    this.icon ,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      cursorColor: Cc.darkGray,

      decoration: InputDecoration(
        prefixIcon: icon,

        fillColor: Colors.black12,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.color,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.color,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,

        hintText: this.placeholder,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        isDense: true,
      ),
      controller: this.controller,
      style: TextStyle(
        color: Cc.black,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,

      ),
      keyboardType: this.keyboardType,
      obscureText: this.password,
      autocorrect: false,
      validator: this.validator,
    );
  }
}
