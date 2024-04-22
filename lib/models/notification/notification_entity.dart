import 'dart:convert';
import 'package:bridgme/generated/json/base/json_field.dart';
import 'package:bridgme/generated/json/notification_entity.g.dart';

@JsonSerializable()
class NotificationEntity {

	String? from;
	String? to;
	@JSONField(name: "date_time")
	int? dateTime;
	String? title;
	String? message;
	String? image;
  
  NotificationEntity();

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => $NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}