import 'dart:convert';

import 'working_day.dart';


class Doctor {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? speciality;
  String? about;
  String? avatar;
  double? rating;
  int? price;
  int? idSpeciality;
  int? goodReviews;
  int? totalScore;
  int? satisfaction;
  int? visitDuration;
  String? category;

  List<WorkingDay>? workingDays;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.speciality,
    this.about,
    this.avatar,
    this.rating,
    this.price,
    this.idSpeciality,
    this.goodReviews,
    this.totalScore,
    this.satisfaction,
    this.visitDuration,
    this.workingDays,
    this.category,
  });

}


