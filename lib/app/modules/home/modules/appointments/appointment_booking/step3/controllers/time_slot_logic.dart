import 'package:bridgme/app/modules/home/modules/counsellor/counsellor_profile/controllers/counsellor_profile_logic.dart';
import 'package:bridgme/app/shared/utils/session.dart';
import 'package:bridgme/models/availability/availability.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/consultant/therapist_entity.dart';
import '../../../../dashboard/controllers/dashboard_controller.dart';

class TimeSlotLogic extends GetxController {

  @Collection<Availability>('availability')
  final availabilityRef = AvailabilityCollectionReference();
  final therapistID;
  @Collection<TherapistEntity>('consultant')
  final therapistRef = TherapistEntityCollectionReference();

  TimeSlotLogic(this.therapistID);

  @override
  void onReady() {
    super.onReady();
    loadTherapistProfile(therapistID);
    loadTherapistAvailabilities(therapistID);

  }

  var therapist = TherapistEntity(
    email:"",
    bio: "",
    fullName: "",
    specialty: "",
    availabilityStatus: true,
    price: 0,
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

  var availabilities = <Availability>[].obs;

  loadTherapistAvailabilities(therapistID) {
    availabilities.value = [
      Availability(
        email: 'doctorstrange@gmail.com',
        day: DateTime.now().millisecondsSinceEpoch,
        slotDuration: 30,
        morningSlots: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,8).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,8,30).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,9).millisecondsSinceEpoch],
        midDaySlots: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,12).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,12,30).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,13).millisecondsSinceEpoch],
        eveningSlots: [],
      ),
      Availability(
        email: "",
        day: DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
        slotDuration: 30,
        morningSlots: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,8).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,8,30).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,9).millisecondsSinceEpoch],
        midDaySlots: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,12).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,12,30).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,13).millisecondsSinceEpoch],
        eveningSlots: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,16).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,16,30).millisecondsSinceEpoch, DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,17).millisecondsSinceEpoch],
      ),
    ];

    autoSelectFirstAvailability();
  }

  var selected_availability = Availability(
    email: '',
    day: 0,
    slotDuration: 0,
    morningSlots: [],
    midDaySlots: [],
    eveningSlots: [],
  ).obs;

  void autoSelectFirstAvailability() {
    selected_availability.value = availabilities[0];
  }

  void updateSelectedAvailability(Availability availability) {
    selected_availability.value = availability;
  }

  var selected_slots = <int>[].obs;

  void updateSelectedTimeSlots(slot, slotDuration) {
    if (!checkIfSlotIsAlreadySelected(slot)) {
      selected_slots.add(slot);
    } else {
      selected_slots.removeWhere((item) => item == slot);
    }
    //pass slot duration
    calculateAppointmentFee(slotDuration);
  }

  var appointmentFee = "".obs;

  calculateAppointmentFee(slotDuration) {
    //pick all slots from selected slots
    //get price from therapist
    appointmentFee.value = "3000";

  }

  checkIfSlotIsAlreadySelected(int slot) {
    return selected_slots.contains(slot);
  }

 bool  validateSlotsChoices() {
    if (selected_slots.isNotEmpty == true){
      return selected_slots.isNotEmpty;
    }
    else{
      SessionUtils.info("Sorry!", "Pick at least one time slot to continue");
      return false;
    }

  }

  var selectedIndex = "".obs;
  updateSelectedIndex(index){
    selectedIndex.value = index;
  }

  getConsultants() {
    therapist.bindStream(therapistRef
        .orderByReview(descending: true)
        .whereEmail(isEqualTo: therapistID)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList().first));
  }

}
