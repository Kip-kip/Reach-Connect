import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'detail_logic.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DetailLogic>();

    return Scaffold(
      body: GetRouterOutlet.builder(
        builder: (context, delegate, currentRoute) {


          return Scaffold(
            body: GetRouterOutlet(
              initialRoute: logic.defaultRoute,
              key: Get.nestedKey(Routes.HOME),
            ),
          );
        },
      ),


    );
  }
}
