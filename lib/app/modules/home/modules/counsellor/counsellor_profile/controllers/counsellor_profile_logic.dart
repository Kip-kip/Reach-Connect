import 'package:bridgme/app/modules/home/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:get/get.dart';

class CounsellorProfileLogic extends GetxController {
  String therapistId;

  CounsellorProfileLogic(this.therapistId);

  @override
  void onInit() {
    loadTherapistProfile(therapistId);
    super.onInit();


  }
  // @override
  // void onReady() {
  //   loadTherapistProfile(therapistId);
  //   super.onInit();
  //
  //
  // }


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
    therapist.bindStream(therapistEntityRef
        .orderByReview(descending: true)
        .whereEmail(isEqualTo: therapistID)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList().first));
  }
  @override
  void dispose() {
    super.dispose();
  }
}
