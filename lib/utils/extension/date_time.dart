import 'package:intl/intl.dart';

extension DateFormatterString on int? {
  String getDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
    String day = DateFormat('EEE').format(date);
    return day;
  }

  String getTime() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
    String time = DateFormat('jm').format(date);
    return time;
  }
}
