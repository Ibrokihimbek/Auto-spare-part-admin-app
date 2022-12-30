// import 'package:intl/intl.dart';

// class TimeWeek {
//   static String getDateTime(int dt) {
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
//     final format = DateFormat.EEEE().format(dateTime).toString();
//     return format;
//   }
// }

// class TimeWeekAndDay {
//   static String getDateTime(int dt) {
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
//     final format = DateFormat.MMMEd().format(dateTime).toString();
//     return format;
//   }
// }

// class TimeHour {
//   static String getDateTime(int dt) {
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
//     final format = DateFormat.Hm().format(dateTime).toString();
//     return format;
//   }
// }

import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat.MMMEd().format(dateTime).toString();
    return format;
  }
}
