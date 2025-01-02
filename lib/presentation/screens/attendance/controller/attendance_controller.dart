import 'package:arkatrack/common/services/location_services.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxService {
  final LocationServices locationServices = Get.find<LocationServices>();

  final RxDouble currentLongitude = 0.0.obs;
  final RxDouble currentLatitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    currentLatitude.value = locationServices.currentLatitude.value;
    currentLongitude.value = locationServices.currentLongitude.value;
  }
}
