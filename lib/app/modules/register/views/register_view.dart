import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../routes/app_pages.dart';
import '../../../shared/components/auth_header/wave_header.dart';
import '../../../shared/components/utility/custom_button.dart';
import '../../../shared/constants/constants.dart';
import '../controllers/register_controller.dart';
import '../widget/input_widget.dart';


class RegisterView extends StatelessWidget {

  final _registrationController = Get.put(RegisterController());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController =  TextEditingController();
  final confirmPasswordController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: Get.height * 0.35,
                      decoration: const BoxDecoration(),
                      child: const WaveHeader(
                        title: 'BridgeMe',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: Center(
                              child: Text(
                                'Create an account to bridgeme started'.tr(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         InputWidget(fullNameController: fullNameController, emailController: emailController, passwordController: passwordController),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: CustomButton(
                              onPressed: () =>
                              {
                                _registrationController.registerUser(fullNameController.text, emailController.text, passwordController.text)
                              },
                              text: 'Sign up'.tr(),
                              textSize: 16,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${'Already a member'.tr()} ?',
                                    style: TextStyle(
                                      color: Color(0xffbcbcbc),
                                      fontSize: 14,
                                      fontFamily: 'NunitoSans',
                                    ),
                                  ),
                                  Text('   '),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(2),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: InkWell(
                                        onTap: (){
                                          Get.rootDelegate.toNamed(Routes.LOGIN);
                                        },
                                        child: Text(
                                          'Login'.tr(),
                                          style: TextStyle(fontSize: 14, color: kColorPrimary),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
