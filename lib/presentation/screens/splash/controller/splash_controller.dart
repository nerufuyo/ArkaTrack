import 'dart:developer';

import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/location_services.dart';
import 'package:arkatrack/common/services/permission_services.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();
  final DevicePermissionServices devicePermissionServices =
      Get.find<DevicePermissionServices>();
  final LocationServices locationServices = Get.find<LocationServices>();

  final LocalImages images = LocalImages();

  final RxString userId = ''.obs;
  final int splashTimer = 3;

  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    Future.wait([
      checkPermissions(),
      screenNavigation(),
    ]);
  }

  Future<void> checkPermissions() async {
    // Request camera permissi
    await devicePermissionServices.requestCameraPermission(
      onDenied: () => log('Permission Status: Camera permission denied.'),
      onGranted: () => log('Permission Status: Camera permission granted.'),
      onPermanentlyDenied: () {
        log('Permission Status: Camera permission permanently denied.');
        devicePermissionServices.openAppSettings();
      },
    );

    // Request location permission
    await devicePermissionServices.requestLocationPermission(
      onDenied: () => log('Permission Status: Location permission denied.'),
      onGranted: () async {
        final locationData = await locationServices.getCurrentLatLong();
        locationData.fold(
          (error) => log('Failed to get location data: $error'),
          (location) {
            locationServices.setCurrentLatLong(
              location.latitude,
              location.longitude,
            );
          },
        );
      },
      onPermanentlyDenied: () {
        log('Permission Status: Location permission permanently denied.');
        devicePermissionServices.openAppSettings();
      },
    );
  }

  Future<void> screenNavigation() async {
    userId.value = await secureStorageServices.readSecureData('userId') ?? '';

    final targetScreen =
        userId.value.isNotEmpty ? ScreenName.dashboard : ScreenName.auth;

    await Future.delayed(Duration(seconds: splashTimer), () {
      GoRouter.of(globalKey.currentContext!).goNamed(targetScreen);
    });
  }
}
