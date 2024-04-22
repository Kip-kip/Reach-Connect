import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'survey_answer.g.dart';

@JsonSerializable()
class SurveyAnswer {
  SurveyAnswer({
      this.email,
      this.question,
      this.answer,
      this.created,});



  String? email;
  String? question;
  String? answer;
  int? created;
}

@Collection<SurveyAnswer>('survey_answers')
final ref= SurveyAnswerCollectionReference();