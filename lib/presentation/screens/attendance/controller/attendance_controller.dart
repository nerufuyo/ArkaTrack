import 'dart:developer';

import 'package:arkatrack/common/services/location_services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxService {
  final LocationServices locationServices = Get.find<LocationServices>();
  final MapController mapController = MapController();

  final RxDouble currentLongitude = 0.0.obs;
  final RxDouble currentLatitude = 0.0.obs;
  final RxDouble distance = 0.0.obs;
  final RxDouble time = 0.0.obs;
  final RxString currentAddress = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    currentLatitude.value = locationServices.currentLatitude.value;
    currentLongitude.value = locationServices.currentLongitude.value;

    final getAddress = await locationServices.getAddress();
    getAddress.fold(
      (error) => log(error),
      (address) => currentAddress.value = address,
    );
  }

  List<Map<String, String>> getDistance() => [
        {
          'title': 'Distance',
          'value': '${distance.value.toStringAsFixed(2)} meters',
        },
        {
          'title': 'Time',
          'value': '${time.value.toStringAsFixed(2)} minutes',
        },
      ];
}
