import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'appointment_model.g.dart';

class AppointmentModel {
  AppointmentModel({
    required this.id,
    required this.appointmentDate,
    required this.completed,
    required this.doctorEmail,
    required this.patientEmail,
    required this.status,
    required this.doctorBill,
    required this.paidAmount,
    required this.doctorName,
    required this.doctorImage,
    this.dialog,
    this.totalCost = 0,
    this.duration = 0,
    this.billStatus = "Pending",
  });

  late String id;
  late int appointmentDate;
  late final bool completed;
  late final String doctorEmail;
  late final String patientEmail;
  late final String status;
  late final int doctorBill;
  late final int paidAmount;
  late String doctorName;
  late String doctorImage;
  String? dialog;
  int? totalCost;
  int? duration;
  String? billStatus;
  double rating = 0.0;

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      id = json['id'] as String;
    } else {
      id = "rere";
    }

    if (json.containsKey('dialog')) {
      dialog = json['dialog'] as String;
    } else {
      dialog = "";
    }

    if (json.containsKey('totalCost')) {
      totalCost = json['totalCost'] as int;
    } else {
      totalCost = 0;
    }

    if (json.containsKey('duration')) {
      duration = json['duration'] as int;
    } else {
      duration = 0;
    }

    if (json.containsKey('billStatus')) {
      billStatus = json['billStatus'] as String;
    } else {
      billStatus = "Pending";
    }

    appointmentDate = json['appointmentDate'] as int;
    completed = json['completed'] as bool;
    doctorEmail = json['doctorEmail'] as String;
    patientEmail = json['patientEmail'] as String;
    status = json['status'] as String;
    doctorBill = json['doctorBill'] as int;
    paidAmount = json['paidAmount'] as int;
    if (json.containsKey('doctorName')) {
      doctorName = json['doctorName'] as String;
    } else {
      doctorName = "";
    }

    if (json.containsKey('doctorImage')) {
      doctorImage = json['doctorImage'] as String;
    } else {
      doctorImage = "";
    }

    if (json.containsKey('rating')) {
      rating = json['rating'] as double;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['appointmentDate'] = appointmentDate;
    _data['completed'] = completed;
    _data['doctorEmail'] = doctorEmail;
    _data['patientEmail'] = patientEmail;
    _data['status'] = status;
    _data['doctorBill'] = doctorBill;
    _data['paidAmount'] = paidAmount;
    _data['doctorName'] = doctorName;
    _data['doctorImage'] = doctorImage;
    _data['totalCost'] = totalCost;
    _data['duration'] = duration;
    _data['billStatus'] = billStatus;
    _data['rating'] = rating;

    _data['dialog'] = dialog;
    return _data;
  }
}

@Collection<AppointmentModel>('appointments')
final appRef = AppointmentModelCollectionReference();
