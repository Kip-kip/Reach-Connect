import 'package:bridgme/app/shared/utils/session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

import '../../../../../../../../../models/appointment/appointment_model.dart';


class MyAppointmentsLogic extends GetxController {

  @override
  void onReady() {
    super.onReady();
    loadUpcomingAppointments();
    loadPastAppointments();
  }

  var upcomingAppointments = <AppointmentModel>[].obs;
  void loadUpcomingAppointments(){
      upcomingAppointments.bindStream(appRef
          .orderByAppointmentDate(descending: true)
          .wherePatientEmail(isEqualTo: SessionUtils.getMail()!)
           .whereCompleted(isEqualTo: false)
          .snapshots()
          .map((event) => event.docs.map((e){
            AppointmentModel data = e.data;
             data.id = e.id;
            return data;
      }).toList()));

  }

  var pastAppointments = <AppointmentModel>[].obs;
  void loadPastAppointments(){
    pastAppointments.bindStream(appRef
        .orderByAppointmentDate(descending: true)
        .wherePatientEmail(isEqualTo: SessionUtils.getMail()!)
        .whereCompleted(isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) {

      AppointmentModel data = e.data;
      data.id = e.id;
      return data;
    }).toList()));
  }

  getDoctorSpecialty(email){
    return "Behavioural";
  }
  getFormattedDate(epochTime){
    return DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(epochTime));
  }

  getFormattedTime(epochTime){
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(epochTime));
  }

}
