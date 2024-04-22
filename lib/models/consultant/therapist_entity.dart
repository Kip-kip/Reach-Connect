import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'therapist_entity.g.dart';

@JsonSerializable()
class TherapistEntity {
  TherapistEntity({
     this.bio,
     this.category,
     this.email,
     this.experience,
     this.fullName,
     this.hospital,
     this.isTherapist,
     this.online,
     this.patientsSeen,
    this.price,
    this.qualificationDocuments,
    this.review,
    this.status,
    this.specialty,
    this.totalScore,
    this.satisfaction,
    this.availabilityStatus,
    this.practiceDetails,
  });

  String? bio;
  String? category;
  String? email;
  int? experience;
  String? fullName;
  String? hospital;
  bool? isTherapist;
  bool? online;
  int? patientsSeen;
  int? price;
  String? qualificationDocuments;
  int? review;
  int? status;
  String? specialty;
  int? totalScore;
  int? satisfaction;
  bool? availabilityStatus;
  String? practiceDetails;
}

@Collection<TherapistEntity>('consultant')
final therapistEntityRef =TherapistEntityCollectionReference();
