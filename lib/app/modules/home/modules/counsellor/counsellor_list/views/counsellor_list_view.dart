import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/constants.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../widgets/my_counsellor_list_item.dart';
import '../controllers/counsellor_list_logic.dart';


class CounsellorListPage extends StatelessWidget {
  final _consellorListController = Get.put(CounsellorListLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(appBarText: "Therapists",)),
      body: Obx(() {
        return ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(
                height: 15,
              ),
          itemCount: _consellorListController.doctors.length,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          itemBuilder: (context, index) {
            return MyCounsellorListItem(
              doctor: _consellorListController.doctors[index],
            );
          },
        );
      }),
    );
  }
}
