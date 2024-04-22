import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/utils/history_appointments_list_item.dart';
import '../my_appointments/controllers/my_appointments_logic.dart';



class HistoryAppointmentsPage extends StatelessWidget {
  final _myAppointmentsController = Get.put(MyAppointmentsLogic());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemCount:  _myAppointmentsController.pastAppointments.length,
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 15,
      ),
      itemBuilder: (context, index) {
        return HistoryAppointmentListItem(appointment:_myAppointmentsController.pastAppointments[index]);
      },
    );
  }
}
