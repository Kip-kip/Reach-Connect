import 'package:bridgme/generated/json/base/json_convert_content.dart';
import 'package:bridgme/models/notification/notification_entity.dart';

NotificationEntity $NotificationEntityFromJson(Map<String, dynamic> json) {
	final NotificationEntity notificationEntity = NotificationEntity();
	final String? from = jsonConvert.convert<String>(json['from']);
	if (from != null) {
		notificationEntity.from = from;
	}
	final String? to = jsonConvert.convert<String>(json['to']);
	if (to != null) {
		notificationEntity.to = to;
	}
	final int? dateTime = jsonConvert.convert<int>(json['date_time']);
	if (dateTime != null) {
		notificationEntity.dateTime = dateTime;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		notificationEntity.title = title;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		notificationEntity.message = message;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		notificationEntity.image = image;
	}
	return notificationEntity;
}

Map<String, dynamic> $NotificationEntityToJson(NotificationEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['from'] = entity.from;
	data['to'] = entity.to;
	data['date_time'] = entity.dateTime;
	data['title'] = entity.title;
	data['message'] = entity.message;
	data['image'] = entity.image;
	return data;
}