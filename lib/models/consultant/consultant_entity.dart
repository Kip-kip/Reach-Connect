import 'dart:convert';

import 'package:bridgme/generated/json/base/json_field.dart';
import 'package:bridgme/generated/json/consultant_entity.g.dart';

@JsonSerializable()
class ConsultantEntity {
  String? fullName;
  String? email;
  int? price;
  double? experience;
  double? review;
  String? hospital;
  String? patientsSeen;
  String? category;
  int? status;

  ConsultantEntity();

  factory ConsultantEntity.fromJson(Map<String, dynamic> json) =>
      $ConsultantEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConsultantEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
