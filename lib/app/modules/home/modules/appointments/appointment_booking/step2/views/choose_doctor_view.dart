import 'package:bridgme/app/modules/home/modules/appointments/appointment_booking/step2/controllers/choose_doctor_logic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/utility/doctor_item.dart';
import '../../../../../../../shared/components/utility/round_icon_button.dart';
import '../../../../../../../shared/constants/constants.dart';
import '../../../../../../../shared/utils/utils.dart';
import '../../../../counsellor/counsellor_list/controllers/counsellor_list_logic.dart';


class ChooseDoctorPage extends StatelessWidget {

  final _chooseDoctorController = Get.put(ChooseDoctorLogic(""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(
            onTap: () {
              goBack();
            },
            child: Icon(Icons.arrow_back_ios_outlined, color: kColorPrimary)),
        centerTitle: true,
        title: Text(
          'Consultants'.tr(), style: TextStyle(color: kColorPrimary),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.rootDelegate.toNamed(Routes.FILTER);
            },
            icon: Icon(
                Icons.filter_list, color: kColorPrimary
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Choose a Therapist'.tr(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6!
                    .copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kColorGreen,
              ),
              child: Row(
                children: <Widget>[
                  RoundIconButton(
                    onPressed: () {},
                    icon: Icons.person_pin,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Any available Therapist'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _chooseDoctorController.doctors.length,
                itemBuilder: (context, index) {
                  return DoctorItem(
                    onTap: () {
                      Map<String, String> params = {"therapistId":_chooseDoctorController.doctors[index].email!};
                      Get.rootDelegate.toNamed(Routes.COUNSELLORPROFILE,parameters: params);
                    },
                    doctor: _chooseDoctorController.doctors[index],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
