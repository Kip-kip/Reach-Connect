import 'package:bridgme/generated/json/base/json_convert_content.dart';

import '../../models/consultant/therapist_entity.dart';


TherapistEntity $TherapistEntityFromJson(Map<String, dynamic> json) {
	final TherapistEntity therapistEntity = TherapistEntity();
	final String? bio = jsonConvert.convert<String>(json['bio']);
	if (bio != null) {
		therapistEntity.bio = bio;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		therapistEntity.category = category;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		therapistEntity.email = email;
	}
	final int? experience = jsonConvert.convert<int>(json['experience']);
	if (experience != null) {
		therapistEntity.experience = experience;
	}
	final String? fullName = jsonConvert.convert<String>(json['full_name']);
	if (fullName != null) {
		therapistEntity.fullName = fullName;
	}
	final String? hospital = jsonConvert.convert<String>(json['hospital']);
	if (hospital != null) {
		therapistEntity.hospital = hospital;
	}
	final bool? isTherapist = jsonConvert.convert<bool>(json['isTherapist']);
	if (isTherapist != null) {
		therapistEntity.isTherapist = isTherapist;
	}
	final bool? online = jsonConvert.convert<bool>(json['online']);
	if (online != null) {
		therapistEntity.online = online;
	}
	final int? patientsSeen = jsonConvert.convert<int>(json['patients_seen']);
	if (patientsSeen != null) {
		therapistEntity.patientsSeen = patientsSeen;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		therapistEntity.price = price;
	}
	final String? qualificationDocuments = jsonConvert.convert<String>(json['qualificationDocuments']);
	if (qualificationDocuments != null) {
		therapistEntity.qualificationDocuments = qualificationDocuments;
	}
	final int? review = jsonConvert.convert<int>(json['review']);
	if (review != null) {
		therapistEntity.review = review;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		therapistEntity.status = status;
	}
	return therapistEntity;
}

Map<String, dynamic> $TherapistEntityToJson(TherapistEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['bio'] = entity.bio;
	data['category'] = entity.category;
	data['email'] = entity.email;
	data['experience'] = entity.experience;
	data['full_name'] = entity.fullName;
	data['hospital'] = entity.hospital;
	data['isTherapist'] = entity.isTherapist;
	data['online'] = entity.online;
	data['patients_seen'] = entity.patientsSeen;
	data['price'] = entity.price;
	data['qualificationDocuments'] = entity.qualificationDocuments;
	data['review'] = entity.review;
	data['status'] = entity.status;
	return data;
}