
import 'package:flutter/material.dart';

import '../../../shared/components/input_field/labeled_text_form_field.dart';



class InputWidget extends StatelessWidget {


  final TextEditingController emailController;
  final TextEditingController passwordController;

  InputWidget({
    Key? key,
    required this.emailController,
    required this.passwordController

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LabeledTextFormField(
            title: 'Email:',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'johndoe@gmail.com',
          ),
          LabeledTextFormField(
            title: 'Password:',
            controller: passwordController,
            obscureText: true,
            hintText: '* * * * * *',
            padding: 0,
          ),
        ],
      ),
    );
  }
}
