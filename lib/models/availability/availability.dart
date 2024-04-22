
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'availability.g.dart';


@JsonSerializable()
class Availability {
  Availability({
      this.email, 
      this.day,
      this.slotDuration,
      this.morningSlots, 
      this.midDaySlots, 
      this.eveningSlots,});

  String? email;
  int? day;
  int? slotDuration;
  List<int>? morningSlots;
  List<int>? midDaySlots;
  List<int>? eveningSlots;

}

@Collection<Availability>('availability')
final availabilityRef= AvailabilityCollectionReference();

//flutter pub run build_runner build --delete-conflicting-outputs