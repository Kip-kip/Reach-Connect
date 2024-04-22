import 'package:bridgme/generated/json/base/json_convert_content.dart';

import '../../models/consultant/consultant_entity.dart';


ConsultantEntity $ConsultantEntityFromJson(Map<String, dynamic> json) {
	final ConsultantEntity consultantEntity = ConsultantEntity();
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		consultantEntity.fullName = fullName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		consultantEntity.email = email;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		consultantEntity.price = price;
	}
	final double? experience = jsonConvert.convert<double>(json['experience']);
	if (experience != null) {
		consultantEntity.experience = experience;
	}
	final double? review = jsonConvert.convert<double>(json['review']);
	if (review != null) {
		consultantEntity.review = review;
	}
	final String? hospital = jsonConvert.convert<String>(json['hospital']);
	if (hospital != null) {
		consultantEntity.hospital = hospital;
	}
	final String? patientsSeen = jsonConvert.convert<String>(json['patientsSeen']);
	if (patientsSeen != null) {
		consultantEntity.patientsSeen = patientsSeen;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		consultantEntity.category = category;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		consultantEntity.status = status;
	}
	return consultantEntity;
}

Map<String, dynamic> $ConsultantEntityToJson(ConsultantEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fullName'] = entity.fullName;
	data['email'] = entity.email;
	data['price'] = entity.price;
	data['experience'] = entity.experience;
	data['review'] = entity.review;
	data['hospital'] = entity.hospital;
	data['patientsSeen'] = entity.patientsSeen;
	data['category'] = entity.category;
	data['status'] = entity.status;
	return data;
}