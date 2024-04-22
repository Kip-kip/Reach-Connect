import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../routes/app_pages.dart';
import '../../../shared/components/text/custom_text_form_field.dart';
import '../../../shared/components/utility/custom_button.dart';
import '../../../shared/constants/constants.dart';
import '../../home/widgets/custom_app_bar.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _forgotController = Get.put(ForgotPasswordController());
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: CustomAppBar(appBarText: "Reset Password",)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 80,
                        ),
                      ),
                      Text(
                        'Forgot password'.tr(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email:'.tr(),
                        style: kInputTextStyle,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: 'johndoe@gmail.com',
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomButton(
                        onPressed: () {
                          _forgotController.forgotPassword(_emailController);
                        },
                        text: 'Reset password'.tr(),
                      )
                    ],
                  ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Get.rootDelegate.toNamed(Routes.LOGIN);
                          },
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 14, color: kColorPrimary),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


