import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_entity.g.dart';

@JsonSerializable()
class UserModelEntity {
  String? id;
  String? fullname;
  String? email;
  String? password;
  String? gender;
  String? phone;
  int? dob;

  UserModelEntity( {
      this.id,
      this.fullname,
      this.email,
      this.password,
      this.gender,
      this.isConsultant,
      this.activated,
      this.phone,
      this.dob
}); //@JSONField(name: "is_consultant")
  int? isConsultant;
  int? activated;
}

@Collection<UserModelEntity>('users')
final userModelEntityRef = UserModelEntityCollectionReference();
