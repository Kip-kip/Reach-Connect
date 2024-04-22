
class FirebaseMessageData {
  int?  id;
  String? type;
  String? initiatorId;
  String? referenceType;
  String? title;
  String? message;

  int?  time;
  String? referenceId;

  FirebaseMessageData(
      {this.time,
      this.id,
      this.type,
      this.initiatorId,
      this.referenceType,
      this.title,
      this.message,
      this.referenceId});

  FirebaseMessageData.fromJson(dynamic json) {
    type = json["type"] as String?;
    initiatorId = json["initiatorId"]  as String?;
    referenceType = json["referenceType"]  as String?;
    title = json["title"]  as String?;
    message = json["message"]  as String?;
    time = json["time"]  as int?;
    id = json["id"]  as int?;
    referenceId = json["referenceId"]  as String?;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    map["initiatorId"] = initiatorId;
    map["referenceType"] = referenceType;
    map["title"] = title;
    map["message"] = message;
    map["time"] = time;
    map["referenceId"] = referenceId;
    map["id"] = id;
    return map;
  }
}
