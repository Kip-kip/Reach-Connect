import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/appointment/appointment_model.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/consultant/therapist_entity.dart';


class AppointmentDetailLogic extends GetxController {
  var userID = "";
  final  appointmentId;

  AppointmentDetailLogic(this.appointmentId);
  @override
  void onReady() {
    super.onReady();
    //if last booking stage
    if(appointmentId ==null){
      loadLatestUserAppointment(userID);
    }

    //if viewed from profile
    loadAppointmentById(appointmentId);
    // appointment.listen((app) {
    //   if(app.doctorEmail.isNotEmpty){
    //       therapist.bindStream(therapistEntityRef
    //           .whereEmail(isEqualTo: app.doctorEmail)
    //           .snapshots()
    //           .map((event) => event.docs.map((e) => e.data).toList().first));
    //     }
    // });
  }

  var appointment = AppointmentModel(
        id:"",
        appointmentDate: 0,
        completed: false,
        doctorEmail: "",
        patientEmail: "",
        status: "",
        doctorBill: 0,
        paidAmount: 0,
        doctorName: "",
        doctorImage:"",
  ).obs;

  loadLatestUserAppointment(userID){
    appointment.value = AppointmentModel(
      id:"1234",
      appointmentDate: 1647269664,
      completed: false,
      doctorEmail: "akikomali@gmail.com",
      patientEmail: "damiandelf@gmail.com",
      status: "Pending",
      doctorBill: 3000,
      paidAmount: 1500,
      doctorName: "Dr Aiko Mali",
      doctorImage:"",
    );

    loadTherapistDetails(appointment.value.doctorEmail);

  }

  loadAppointmentById(appointmentId){

    appointment.bindStream(appRef
        .orderByAppointmentDate(descending: true)
        .whereId(isEqualTo: appointmentId)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList().first));
  }


  var therapist = TherapistEntity(
    email:"",
    bio: "",
    fullName: "Not found",
    specialty: "",
    availabilityStatus: true,
    price: 0,
    review: 0,
    totalScore: 0,
    satisfaction: 0,
    practiceDetails:""

  ).obs;

  loadTherapistDetails(String email){
    therapist.bindStream(therapistEntityRef
        .whereEmail(isEqualTo: email)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList().first));

  }

}
