import 'package:flutter/material.dart';

class Constants {
  static const baseUrl = "https://api.hmis.uzimahealth.org";
  static const socketBaseUrl = "http://192.168.100.63:7080";
  static const accessToken = "access-token";
  static const String IMAGE_URL = baseUrl + "/v1/file?fileId=";

  static const kPrimaryColor = Color(0xFF4280ff);
  static const kPrimaryLightColor = Color(0xFFc6d9ff);
  static const kPrimaryLightestColor = Color(0x30000000);

  static String kSession = "Session";
  static String kIsLoggedIn = "IsLoggedIn";
  static String kVisitTypeOnline = "ONLINE";

  static const String kUserId = "UserId";
  static const String kUserFullName = "UserFullName";
  static const String kUserAvatar = "UserAvatar";

  static String kPageLimit = "10";
  static String kTimezone = "TimeZone";
  static String kStatusPending = "PENDING";

  static String kPhone = "Phone";
  static String kUser = "UserData";
  static String kUsersCollection = "calls";

  static String kEmail = "Email";
  static String kImageUrl = '$baseUrl/v1/account/avatar';
  static String kFirebaseToken = "FIREBASE_TOKEN";
  static String kDbName = "applicationdbx1.db";
}

const kPrimaryColor = Color(0xFF4280ff);
const kPrimaryLightColor = Color(0xFFc6d9ff);
