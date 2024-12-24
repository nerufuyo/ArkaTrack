import 'package:arkatrack/presentation/screens/absence/controller/attendance_controller.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final AttendanceController attendanceController = AttendanceController();

  @override
  void initState() {
    super.initState();
    attendanceController.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTypography(
          text: 'Attendance',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              // initialCenter: LatLng(51.509364, -0.128928),
              initialZoom: 9.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution('OpenStreetMap contributors',
                      onTap: () {}),
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
