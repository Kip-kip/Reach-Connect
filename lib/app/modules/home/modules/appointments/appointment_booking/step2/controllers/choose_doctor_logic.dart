import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/consultant/therapist_entity.dart';


class ChooseDoctorLogic extends GetxController {
  @Collection<TherapistEntity>('consultant')
  final therapistRef = TherapistEntityCollectionReference();
  var doctors = <TherapistEntity>[].obs;

  String categoryId;
  ChooseDoctorLogic(this.categoryId);

  @override
  void onReady() {
    super.onReady();
    getConsultants(categoryId);
  }

  getConsultants(categoryId) {
    doctors.bindStream(therapistRef
        .orderByReview(descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

}
