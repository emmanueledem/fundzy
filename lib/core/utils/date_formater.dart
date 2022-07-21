import 'package:intl/intl.dart';

class DateUtil {
  static bool validateDate(String date) {
    try {
      DateTime.parse(date);
      return true;
    } on FormatException {
      return false;
    }
  }

  static String formatDate(DateTime dateTime) {
    var formmer = DateFormat('yyyy/MM/dd');
    return formmer.format(dateTime);
  }
}
