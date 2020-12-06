import 'package:intl/intl.dart'; // for date format

class Time {
  int hour;
  int minute;

  Time(this.hour, [this.minute = 0]);

  /// [time] format : [9:00]
  Time.fromString(String time) {
    //.eg time: 09:00
    List<int> temp = time.split(":").map((e) => int.parse(e)).toList();
    hour = temp.elementAt(0);
    minute = temp.elementAt(1) ?? 0;
  }

  /// [time] format : [9:00-10:15]
  static List<Time> parseFromString(String time) {
    return time.split("-").map((e) => Time.fromString(e)).toList();
  }

  bool isAfter(Time other) => hour == other.hour ? minute >= other.minute : hour > other.hour;

  bool isBefore(Time other) => hour == other.hour ? minute <= other.minute : hour < other.hour;

  DateTime toDateTime() => DateTime(1, 1, 1, hour, minute);

  static String convertToTimeStyle(String dateTime1, String dateTime2) =>
      "${dateTime1.substring(0, 5)}-${dateTime2.substring(0, 5)}";

  static String convertFromDateTimeToTimeStyle(DateTime dateTime1, DateTime dateTime2) =>
      "${DateFormat.Hm().format(dateTime1)}-${DateFormat.Hm().format(dateTime2)}";

  Duration difference(Time other) =>
      DateTime(2020, 1, 1, hour, minute).difference(DateTime(2020, 1, 1, other.hour, other.minute));
}
