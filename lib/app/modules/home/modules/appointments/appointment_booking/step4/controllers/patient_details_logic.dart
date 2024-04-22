import 'package:bridgme/app/routes/app_pages.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/chat/dialog_model.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/appointment/appointment_model.dart';
import '../../../../../../../../models/consultant/therapist_entity.dart';

class PatientDetailsLogic extends GetxController {
  final therapistId;
  @Collection<TherapistEntity>('consultant')
  final therapistRef =TherapistEntityCollectionReference();

  PatientDetailsLogic(this.therapistId);

  @override
  void onReady() {
    super.onReady();
    loadTherapistProfile(therapistId);
  }

  @Collection<AppointmentModel>('appointments')
  final appRef = AppointmentModelCollectionReference();

  @Collection<DialogModel>('dialogs')
  final dialogRef = DialogModelCollectionReference();

  var therapist = TherapistEntity(
    email: "",
    bio: "",
    fullName: "",
    specialty: "",
    availabilityStatus: true,
    review: 0,
    totalScore: 0,
    satisfaction: 0,
  ).obs;

  loadTherapistProfile(therapistID) {
    therapist.bindStream(therapistRef
        .orderByReview(descending: true)
        .whereEmail(isEqualTo: therapistID)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList().first));
  }

  void confirmBookingDetails(List<int> bookedSlots, int fees) async {
    print(bookedSlots);
    print(fees);
    var shots = await dialogRef
        .whereOwners(arrayContainsAny: [SessionUtils.getMail()!]).get();
    var dialogs = shots.docs.where(
        (element) => element.data.owners.contains(therapist.value.email!));
    String dialoId = "";
    if (dialogs.isEmpty) {
      var model = DialogModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          ownersData: [
            OwnersData(
                image: "",
                user: therapist.value.email!,
                userName: therapist.value.fullName!),
            OwnersData(
                image: "",
                user: SessionUtils.getMail()!,
                userName: SessionUtils.getUsername()!)
          ],
          lastMessageTime: DateTime.now().millisecondsSinceEpoch,
          lastMessageText: "Appointment created",
          owners: [therapist.value.email!, SessionUtils.getMail()!]);
      var res = await dialogRef.add(model);
      dialoId = res.id;
    }

    var app = new AppointmentModel(
        id: "",
        appointmentDate: bookedSlots.first,
        completed: false,
        doctorEmail: therapist.value.email!,
        patientEmail: SessionUtils.getMail()!,
        status: "Pending",
        doctorBill: fees,
        paidAmount: 0,
        doctorName: therapist.value.fullName!,
        doctorImage: "");
    app.dialog = dialoId;
    appRef.add(app).then((value) {
      var map = {"appointmentId": value.id};
      Get.rootDelegate.toNamed(Routes.APPOINTMENT_BOOKED_PAGE, parameters: map);
    });

    //list of booked slots epoch time
  }
}
