// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const HOME = _Paths.HOME;

  static const PROFILE = _Paths.HOME + _Paths.PROFILE;
  static const CHATROOM = _Paths.HOME +_Paths.CHATROOM;
  static const CHAT_DIALOGS = _Paths.HOME + _Paths.CHAT_DIALOGS;
  static const SETTINGS = _Paths.SETTINGS;
  static const PRODUCTS = _Paths.HOME + _Paths.PRODUCTS;

  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const HEALTHCARE_CONCERN = _Paths.HEALTHCARE_CONCERN;
  static const CHOOSE_DOCTOR = _Paths.CHOOSE_DOCTOR;
  static const FILTER = _Paths.FILTER;
  // static const STORIES = _Paths.STORIES;
  static const DASHBOARD = _Paths.HOME + _Paths.DASHBOARD;
  static const COUNSELLORLIST = _Paths.COUNSELLORLIST;
  static const COUNSELLORPROFILE = _Paths.COUNSELLORPROFILE;
  static const TIME_SLOT_PAGE = _Paths.TIME_SLOT_PAGE;
  static const PATIENT_DETAILS_PAGE = _Paths.PATIENT_DETAILS_PAGE;
  static const APPOINTMENT_BOOKED_PAGE = _Paths.APPOINTMENT_BOOKED_PAGE;
  static const APPOINTMENT_DETAIL = _Paths.APPOINTMENT_DETAIL;
  static const MY_APPOINTMENTS = _Paths.MY_APPOINTMENTS;
  static const JOURNAL_LIST = _Paths.JOURNAL_LIST;
  static const JOURNAL_DETAILS = _Paths.JOURNAL_DETAILS;
  static const CHATROOM_DETAILS = _Paths.CHATROOM_DETAILS;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;

  static const  String SURVEY_QUESTIONS= "/questions";

  static const String SURVEY_INTRO="/question_intro";

  static const ARTICLES="/articles";
  static const INBOX = "/inbox";
  static const NEW_CHAT_ROOM= "/new_chat_room";

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';

  static String THERAPIST_DETAILS(String therapistId) => '/$therapistId';
  static String APP_DETAILS(String defaultRoute ) => '/$defaultRoute';
  static String STORY_PAGE = _Paths.USER_STORIES;
}

abstract class _Paths {
  static const HOME = '/home';
  static const APP_PAGE ="/pageDetail";
  static const PRODUCTS = '/products';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const THERAPIST_DETAILS = '/:therapistId';
  static const APPOINTMENT_DETAILS= "/:appointmentId";
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const DASHBOARD = '/dashboard';
  static const CHATROOM = "/chatroom";
  static const CHATROOM_DETAILS = "/chatroom_details";
  static const HEALTHCARE_CONCERN = "/healthcare_concern";
  static const CHOOSE_DOCTOR = "/choose_doctor";
  static const FILTER = "/filter";
  static const CHAT_DIALOGS ="/chat_dialogs";
  static const NOTIFICATION="/notification";
  // static const STORIES="/stories";
  static const COUNSELLORLIST = "/counsellor_list";
  static const COUNSELLORPROFILE = "/counsellor_profile";
  static const TIME_SLOT_PAGE = "/time_slot_page";
  static const PATIENT_DETAILS_PAGE = "/patient_details_page";
  static const APPOINTMENT_BOOKED_PAGE = "/appointment_booked_page";
  static const  APPOINTMENT_DETAIL = "/appointment_detail";
  static const MY_APPOINTMENTS = "/my_appointments";
  static const JOURNAL_LIST = "/journal_list";
  static const JOURNAL_DETAILS = "/journal_details";

  static const USER_STORIES = "/user_stories";
  static const INBOX = "/inbox";
  static const NEW_CHAT_ROOM= "/new_chat_room";
  static const EDIT_PROFILE = "/edit_profile";
}