import 'package:bridgme/models/consultant/therapist_entity.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';

import '../../../../../../../models/consultant/doctor.dart';


class CounsellorListLogic extends GetxController {

  @Collection<TherapistEntity>('consultant')
  final therapistRef = TherapistEntityCollectionReference();
  var doctors = <TherapistEntity>[].obs;
  var categoryID = "".obs;

  @override
  void onInit() {
    getConsultants();
    //if choose healthconcern
    getCategoryConsultants(categoryID);
    super.onInit();
  }
  getConsultants() {
    doctors.bindStream(therapistRef
        .orderByReview(descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList()));
  }

  getCategoryConsultants(categoryID){

  }

  // List<Doctor> counsellors = [
  //   Doctor(
  //     name: 'David susan',
  //     speciality: 'Therapist',
  //     about:
  //     'Therapist with experience more than 5 years.',
  //     avatar: 'assets/images/icon_doctor_2.png',
  //     rating: 4.7,
  //     price: 90,
  //   ),
  //   Doctor(
  //     name: 'Sheila kamar',
  //     speciality: 'Therapist',
  //     about:
  //     'Great therapist',
  //     avatar: 'assets/images/icon_doctor_3.png',
  //     rating: 4.3,
  //     price: 100,
  //   ),
  //   Doctor(
  //     name: 'Jeptoo',
  //     speciality: 'Therapist',
  //     about:
  //     'Specialist with experience more than 5 years.',
  //     avatar: 'assets/images/icon_doctor_4.png',
  //     rating: 4.7,
  //     price: 100,
  //   ),
  //   Doctor(
  //     name: 'Mercy',
  //     speciality: 'Therapist',
  //     about:
  //     'Therapist with experience more than 5 years.',
  //     avatar: 'assets/images/icon_doctor_5.png',
  //     rating: 4.7,
  //     price: 100,
  //   ),
  // ];

}
