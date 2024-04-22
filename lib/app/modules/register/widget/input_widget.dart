import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../shared/components/input_field/labeled_text_form_field.dart';
import '../../../shared/constants/constants.dart';
import '../controllers/register_controller.dart';


class InputWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final _registrationController = Get.put(RegisterController());

  InputWidget({
    Key? key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LabeledTextFormField(
                title: 'Full Name:'.tr(),
                controller: fullNameController,
                hintText: 'John Doe',
              ),

              Text(
                'Gender:'.tr(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(left :8.0),
            child: Row(
              children: <Widget>[
                Obx(() {
                  return Radio(
                    value: "Male",
                    groupValue: _registrationController.selectedGender.value,
                    onChanged: (value) {
                      _registrationController.updateGender(value.toString());
                    },
                  );
                }),
                Text(
                  'male'.tr(),
                  style: kInputTextStyle,
                ),
                SizedBox(
                  width: 30,
                ),
                Obx(() {
                  return Radio(
                    value: "Female",
                    groupValue: _registrationController.selectedGender.value,
                    onChanged: (value) {
                      _registrationController.updateGender(value.toString());
                    },
                  );
                }),
                Text(
                  'female'.tr(),
                  style: kInputTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LabeledTextFormField(
                title: 'Email:'.tr(),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'johndoe@gmail.com',
              ),
              LabeledTextFormField(
                title: 'Password:'.tr(),
                controller: passwordController,
                obscureText: true,
                hintText: '* * * * * *',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
