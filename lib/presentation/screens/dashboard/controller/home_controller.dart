import 'package:arkatrack/common/statics/enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString attendanceType = ''.obs;

  String setAttendanceType(int index) => switch (index) {
        0 => attendanceType.value = AttendanceType.clockIn.toString(),
        1 => attendanceType.value = AttendanceType.clockOut.toString(),
        _ => attendanceType.value = '',
      };
}
