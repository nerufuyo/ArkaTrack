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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppMinimalisHeaderWidget(
          title: 'Attendance',
          onBack: () => GoRouter.of(context).goNamed(ScreenName.dashboard),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                controller.currentLatitude.value,
                controller.currentLongitude.value,
              ),
              initialZoom: 16,
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
              height: 220,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: List.generate(
                      2,
                      (index) => AppTypography(
                        text: index == 0
                            ? 'Your Location'
                            : 'Jl. Raya Bogor, No. 1, Jakarta',
                        fontSize: index == 0
                            ? AppFontSize.extraLarge
                            : AppFontSize.large,
                        fontWeight:
                            index == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ).withVerticalSpacing(4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          AppTypography(
                            text: 'Distance',
                            fontSize: AppFontSize.small,
                            color: AppColors.black,
                          ),
                          AppTypography(
                            text: '0.5 km',
                            fontSize: AppFontSize.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppTypography(
                            text: 'Accuracy',
                            fontSize: AppFontSize.small,
                            color: AppColors.black,
                          ),
                          AppTypography(
                            text: '10 m',
                            fontSize: AppFontSize.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppButtonWidget(
                    onClicked: () {},
                    buttonText: 'Clock In',
                  ),
                ],
              ).withVerticalSpacing(8),
            ),
          ),
        ],
      ),
    );
  }
}
