import 'package:bridgme/models/user/user_model_entity.dart';

import '../user/avatar.dart';



class Message {
  String? type;
  String? status;
  String? id;
  UserModelEntity? user;
  Avatar? file;
  String? text;
  String? dialog;
  String? createdAt;
  String? updatedAt;

  static String? kTEXT = "TEXT";
  static String? kFILE = "FILE";
  static String? kVIDEO_CALL = "VIDEO_CALL";
  static String? kVOICE_CALL = "VOICE_CALL";

  Message(
      {this.type,
      this.status,
      this.id,
      this.user,
      this.text,
      this.dialog,
      this.createdAt,
      this.updatedAt,
      this.file});

  // Message.fromJson(dynamic json) {
  //   type = json["type"];
  //   status = json["status"];
  //   id = json["_id"];
  //   user = json["user"] != null ? UserModelEntity.fromJson(json["user"]) : null;
  //   text = json["text"];
  //   dialog = json["dialog"];
  //   file = json["file"] != null ? Avatar.fromJson(json["file"]) : null;
  //   createdAt = json["createdAt"];
  //   updatedAt = json["updatedAt"];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   var map = <String, dynamic>{};
  //   map["type"] = type;
  //   map["status"] = status;
  //   map["_id"] = id;
  //   if (user != null) {
  //     map["user"] = user?.toJson();
  //   }
  //   if (file != null) {
  //     map["avatar"] = file?.toJson();
  //   }
  //
  //
  //   map["text"] = text;
  //   map["dialog"] = dialog;
  //   map["createdAt"] = createdAt;
  //   map["updatedAt"] = updatedAt;
  //   return map;
  // }
}
