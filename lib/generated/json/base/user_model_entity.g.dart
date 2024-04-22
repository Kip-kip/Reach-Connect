import 'package:bridgme/generated/json/base/json_convert_content.dart';
import 'package:bridgme/models/user/user_model_entity.dart';

UserModelEntity $UserModelEntityFromJson(Map<String, dynamic> json) {
	final UserModelEntity userModelEntity = UserModelEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userModelEntity.id = id;
	}
	final String? fullname = jsonConvert.convert<String>(json['first_name']);
	if (fullname != null) {
		userModelEntity.fullname = fullname;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);

	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userModelEntity.email = email;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userModelEntity.password = password;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		userModelEntity.gender = gender;
	}
	final int? isConsultant = jsonConvert.convert<int>(json['is_consultant']);
	if (isConsultant != null) {
		userModelEntity.isConsultant = isConsultant;
	}
	final int? activated = jsonConvert.convert<int>(json['activated']);
	if (activated != null) {
		userModelEntity.activated = activated;
	}
	return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['first_name'] = entity.fullname;

	data['email'] = entity.email;
	data['password'] = entity.password;
	data['gender'] = entity.gender;
	data['is_consultant'] = entity.isConsultant;
	data['activated'] = entity.activated;
	return data;
}