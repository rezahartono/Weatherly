// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class DateTimeUtils {
  String GET_DATE_TIME(int millisecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecond * 1000);
    String dateFormat = DateFormat("dd MMMM", "en_EN").format(date);
    String dayFormat = DateFormat('EEEE', 'en_EN').format(date);
    String today = DateFormat('EEEE', 'en_EN').format(DateTime.now());

    if (dayFormat == today) {
      return 'Today, $dateFormat';
    } else {
      return '$dayFormat, $dateFormat';
    }
  }

  String GET_DAY(int millisecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecond * 1000);
    String dayFormat = DateFormat('EEEE', 'en_EN').format(date);
    String today = DateFormat('EEEE', 'en_EN').format(DateTime.now());

    if (dayFormat == today) {
      return 'Today';
    } else {
      return dayFormat;
    }
  }

  String GET_DAY_NAME(int millisecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecond * 1000);
    String dayFormat = DateFormat('EEE', 'en_EN').format(date);

    return dayFormat;
  }

  String GET_HOUR(int millisecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecond * 1000);
    String dateFormat = DateFormat("HH:mm", "en_EN").format(date);

    return dateFormat;
  }

  bool IS_TODAY_DATE(int mil) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(mil * 1000);
    String dateFormat = DateFormat("HH", "en_EN").format(date);
    String todayDate = DateFormat("HH", "en_EN").format(DateTime.now());

    if (dateFormat == todayDate) {
      return true;
    } else {
      return false;
    }
  }
}

DateTimeUtils DATE_TIME = DateTimeUtils();
