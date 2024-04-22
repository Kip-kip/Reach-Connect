import 'package:bridgme/app/modules/home/modules/appointments/appointment_info/appointment_profile/my_appointments/controllers/my_appointments_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/utils/upcoming_appointment_list_item.dart';


class UpcomingAppointmentsPage extends StatelessWidget {
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(
              height: 15,
            ),
        itemCount: _myAppointmentsController.upcomingAppointments.length,
        padding: EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 15,
        ),
        itemBuilder: (context, index) {
          return UpcomingAppointmentListItem(
              appointment: _myAppointmentsController
                  .upcomingAppointments[index]);
        },
      );
    });
  }
}
