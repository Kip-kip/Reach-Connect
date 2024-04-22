import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/components/utility/custom_button.dart';
import '../../../../../../../shared/constants/constants.dart';




class AppointmentBookedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkGreen,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/thumb_success.png'),
              SizedBox(
                height: 60,
              ),
              Text(
                'Appointment booked successfully'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Your appointment has been booked'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomButton(
                  onPressed: () {

                    Map<String,String> map = {"appointmentId": Get.rootDelegate.parameters["appointmentId"]!};
                    Get.rootDelegate.toNamed(Routes.APPOINTMENT_DETAIL,parameters: map);
                  },
                  text: 'Done',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
