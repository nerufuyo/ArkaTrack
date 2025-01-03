import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/presentation/screens/attendance/controller/attendance_controller.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/presentation/widgets/app_min_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppMinimalisHeaderWidget(
            title: 'Attendance',
            onBack: () => GoRouter.of(globalKey.currentContext!)
                .goNamed(ScreenName.dashboard),
          ),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                initialCenter: LatLng(
                  controller.currentLatitude.value,
                  controller.currentLongitude.value,
                ),
                initialZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  alignment: Alignment.center,
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(
                        controller.currentLatitude.value,
                        controller.currentLongitude.value,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.error,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                        2,
                        (index) => AppTypography(
                          text: index == 0
                              ? 'You are at'
                              : controller.currentAddress.value,
                          fontSize: index == 0
                              ? AppFontSize.extraLarge
                              : AppFontSize.medium,
                          fontWeight:
                              index == 0 ? FontWeight.bold : FontWeight.normal,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ).withVerticalSpacing(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        controller.getDistance().length,
                        (index) => Column(
                          children: [
                            AppTypography(
                              text: controller.getDistance()[index]['title']!,
                              fontSize: AppFontSize.medium,
                              fontWeight: FontWeight.bold,
                            ),
                            AppTypography(
                              text: controller.getDistance()[index]['value']!,
                              fontSize: AppFontSize.medium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppButtonWidget(
                      buttonText: 'Clock In/Out',
                      onClicked: () =>
                          GoRouter.of(globalKey.currentContext!).goNamed(
                        ScreenName.faceRecognition,
                      ),
                    ),
                  ],
                ).withVerticalSpacing(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
