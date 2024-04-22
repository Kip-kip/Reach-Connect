
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'survey_question.g.dart';

@JsonSerializable()
class SurveyQuestion {
  SurveyQuestion({
      this.id,
      this.number, 
      this.question, 
      this.options,});


  int? number;
  String? id;
  String? question;
  List<String>? options;


}

@Collection<SurveyQuestion>('survey_questions')
final surveyQuestionsRef = SurveyQuestionCollectionReference();
