
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_room_model.g.dart';

@JsonSerializable()
class ChatRoomModel {
  ChatRoomModel({
    required this.postId,
    required this.title,
    required this.text,
    this.category = "",
    required this.createdAt,
    required this.ownerId,
    required this.mood,
    required this.image,
  });
  late final String title;
  late final String postId;
  late final String category;
  late final String text;
  late final String createdAt;
  late final String ownerId;
  late final String mood;
  late final String image;
  late List<String> comments;

  ChatRoomModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    text = json['text'];
    text = json['category'];
    createdAt = json['createdAt'];
    ownerId = json['owner'];
    postId = json['postId'];
    mood = json['mood'];image = json['image'];
    comments = List.castFrom<dynamic, String>(json['comments']);

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['text'] = text;
    _data['category'] = text;
    _data['createdAt'] = createdAt;
    _data['ownerId'] = ownerId;
    _data['postId'] = postId;
    _data['comments'] = comments;
    _data['mood'] = mood; _data['image'] = image;
    return _data;
  }
}

@Collection<ChatRoomModel>('chatroom')
final therapistRef =ChatRoomModelCollectionReference();