import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static String differenceBtnDatesInYrs(DateTime dateTime, DateTime dateTime2) {
    var termString = "";
    var years = (dateTime2.difference(dateTime).inDays / 360);
    if (years < 1) {
      termString = "Verified";
    } else {
      termString = '${years.round()}+ Yrs Experience';
    }

    return termString;
  }

  static String formateDateForServer(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateFormat formatter2 = DateFormat('HH:mm:ss');
    final String formatted = formatter.format(dateTime);
    final String formatted2 = formatter2.format(dateTime);
    return "${formatted}T$formatted2.000Z";
  }

  static bool checkIfDateIsFuture(
    DateTime date,
  ) {
    return date.microsecondsSinceEpoch > DateTime.now().microsecondsSinceEpoch;
  }

  static String formatReadableDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  static String formatDateWithPattern(DateTime dateTime, String pattern) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }

  static String longReadableDate(DateTime dateTime) {
    return formatDateWithPattern(dateTime, 'EEE, MMM d, yyyy hh:mm aaa ');
  }

  static DateTime? convertDate(String dateString) {
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }

  static String shortReadableDate(DateTime dateTime) {
    dateTime = dateTimeToZone(zone: 'UTC', datetime: dateTime);
    return formatDateWithPattern(dateTime, 'EEE, d, MMM, yyyy hh:mm aaa ');
  }

  static String shortReadableTime(DateTime dateTime) {
    dateTime = dateTimeToZone(zone: 'UTC', datetime: dateTime);
    return formatDateWithPattern(dateTime, 'hh:mm aaa ');
  }

  static String datePrefix(DateTime dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return "Today";
    } else if (aDate == yesterday) {
      return "Yesterday";
    } else if (aDate == tomorrow) {
      return "Tomorrow";
    } else {
      return "";
    }
  }
}

String formatReadableDate(DateTime dateTime) {
final DateFormat formatter = DateFormat('dd MMM yyyy');
return formatter.format(dateTime);
}

