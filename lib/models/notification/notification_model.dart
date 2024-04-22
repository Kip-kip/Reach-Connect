
import 'package:hive/hive.dart';
part 'notification_model.g.dart';
@HiveType(typeId: 0)
class NotificationModel  extends HiveObject{
  @HiveField(0)
  int?  id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? text;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? type;
  @HiveField(5)
  bool? seen;
  @HiveField(6)
  int? time;

  NotificationModel( {this.title, this.text, this.image, this.type, this.seen, this.id, this.time});

  NotificationModel.fromJson(dynamic json) {
    title = json["title"] as String?;
    text = json["text"] as String?;
    image = json["image"] as String?;
    type = json["type"] as String?;
    seen = json["seen"] as bool?;
    id = json["id"] as int? ;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["text"] = text;
    map["image"] = image;
    map["type"] = type;
    map["seen"] = seen;
    map["id"] = id;
    return map;
  }
}
