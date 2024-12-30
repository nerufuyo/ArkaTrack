import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateServices extends GetxService {
  DateTime now = DateTime.now();

  String getFormattedDate() {
    String formattedDate = DateFormat('EE, dd MMM yyyy').format(now);
    return formattedDate;
  }

  String getFormattedTime(DateTime date) {
    String formattedTime = DateFormat('hh:mm:ss a').format(date);
    return formattedTime;
  }

  String getFormattedDateTime(DateTime date) {
    String formattedDateTime =
        DateFormat('EEEE, dd MMMM yyyy hh:mm a').format(date);
    return formattedDateTime;
  }

  String getFormattedDateWithTime(DateTime date) {
    String formattedDateTime =
        DateFormat('EEEE, dd MMMM yyyy hh:mm a').format(date);
    return formattedDateTime;
  }

  String getFormattedTimeWithDate(DateTime date) {
    String formattedDateTime = DateFormat('hh:mm a').format(date);
    return formattedDateTime;
  }
}
