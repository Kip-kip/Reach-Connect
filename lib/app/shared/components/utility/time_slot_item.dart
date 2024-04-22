
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import '../../constants/constants.dart';

class TimeSlotItem extends StatelessWidget {
  final String time;
  final void Function() onTap;
  final bool selected;
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

   TimeSlotItem({Key? key, required this.time, required this.onTap, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected? kColorGreen: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            Text(
              _myAppointmentsController.getFormattedTime(int.parse(time)),
              style: TextStyle(
                color: selected ?Colors.white :kColorPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
