import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_category_entity.g.dart';

@JsonSerializable()
class ArticleCategoryEntity {
  String? title;
  String? subtitle;
  String? categoryid;
  String? image;
  int? views;
}

@Collection<ArticleCategoryEntity>('article_category')
final articleCategory =ArticleCategoryEntityCollectionReference();