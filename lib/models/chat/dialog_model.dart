
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dialog_model.g.dart';

@JsonSerializable()
class DialogModel {
  DialogModel({
    required this.id,
    required this.ownersData,
    required this.lastMessageTime,
    required this.lastMessageText,
    required this.owners,
  });

  late String id;
  late final List<OwnersData> ownersData;
  late final int lastMessageTime;
  late final String lastMessageText;
  late final List<String> owners;

  DialogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    ownersData = List.from(json['owners_data'] as List)
        .map((e) => OwnersData.fromJson(e as Map<String, dynamic>))
        .toList();
    lastMessageTime = json['last_message_time'] as int;
    lastMessageText = json['last_message_text'] as String;
    owners = List.castFrom<dynamic, String>(json['owners'] as List);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['owners_data'] = ownersData.map((e) => e.toJson()).toList();
    _data['last_message_time'] = lastMessageTime;
    _data['last_message_text'] = lastMessageText;
    _data['owners'] = owners;
    return _data;
  }
}

class OwnersData {
  OwnersData({
    required this.image,
    required this.user,
    required this.userName,
  });

  late String image;
  late final String user;
  late String userName;

  OwnersData.fromJson(Map<String, dynamic> json) {
    image = json['image'] as String;
    user = json['user'] as String;
    userName = json['userName'] as String;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['user'] = user;
    _data['userName'] = userName;
    return _data;
  }
}

@Collection<DialogModel>('dialogs')
final therapistRef =DialogModelCollectionReference();