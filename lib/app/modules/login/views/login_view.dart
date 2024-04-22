import 'package:bridgme/app/shared/constants/base_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/components/auth_header/wave_header.dart';
import '../../../shared/components/button/outline_button_option.dart';
import '../../../shared/components/button/primary_button_option.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/constants.dart';
import '../controllers/login_controller.dart';
import '../widget/input_widget.dart';

class LoginView extends GetView<LoginController> {
  final _loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        Get.rootDelegate.toNamed(Routes.FORGOT_PASSWORD);
      },
      child: const Text(
        "Forgot your password?",
        style: TextStyle(fontSize: 14, color: kColorPrimary),
      ),
    );
  }

  Widget buildSocialLoginFacebook() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: Colors.blueAccent, // backgroundound
        ),
        onPressed: () {
          _loginController.loginWithFacebook();
        },
        child: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            "Login with facebook",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget buildSocialLoginGoogle() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          primary: Colors.red, // backgroundound
        ),
        onPressed: () {
          _loginController.loginWithGoogle();
        },
        child: Row(
          children: [
            SvgPicture.asset("assets/images/facebook.svg"),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Login with google",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToRegister() {
    return Row(
      children: [
        FlatButton(
          child: const Text(
            "You don't have an account?",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: () {
            Get.rootDelegate.toNamed(Routes.REGISTER);
          },
          child: Text(
            "Register now",
            style: TextStyle(fontSize: 14, color: kColorPrimary),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    var h = MediaQuery.of(context).size.height;

    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          body: controller.isLoading.value
              ? Container(
                  height: Get.height,
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Cc.kPrimaryColor,
                      ),
                      Text(controller.progressStatus.value),
                    ],
                  )))
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: w,
                        height: h * 0.35,
                        decoration: const BoxDecoration(),
                        child: const WaveHeader(
                          title: 'BridgeMe',
                        ),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          width: w,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 8.0, bottom: 20.0),
                                child: Text(
                                  "Login to your account to continue",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InputWidget(
                                  emailController: emailController,
                                  passwordController: passwordController),
                              const SizedBox(
                                height: 10.0,
                              ),
                              PrimaryButtonOption(
                                text: "Login Now",
                                onPressed: () {
                                  _loginController.loginWithEmail(
                                      emailController.text,
                                      passwordController.text);
                                },
                                colour: kColorGreen,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              buildForgotPassword(),
                              const SizedBox(
                                height: 10.0,
                              ),
                              OutlineButtonOption(
                                text: "Login with facebook",
                                onPressed: () {
                                  _loginController.loginWithFacebook();
                                },
                                outlineColour: 0xff006400,
                                iconPath: 'assets/svgs/facebook.svg',
                              ),
                              OutlineButtonOption(
                                text: "Login with google",
                                onPressed: () {
                                  _loginController.loginWithGoogle();
                                },
                                outlineColour: 0xff006400,
                                iconPath: 'assets/svgs/google.svg',
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              buildToRegister()
                            ],
                          ))
                    ],
                  ),
                ));
    });
  }
}
