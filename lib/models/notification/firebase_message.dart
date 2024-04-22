import 'data.dart';

class FirebaseMessage {
  FirebaseMessageData? data;

  FirebaseMessage({this.data});

  FirebaseMessage.fromJson(dynamic json) {
    data = json["data"] != null
        ? FirebaseMessageData.fromJson(json["data"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }
}
