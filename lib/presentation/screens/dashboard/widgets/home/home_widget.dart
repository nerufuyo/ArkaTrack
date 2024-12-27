import 'package:arkatrack/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home/home_announcement_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home/home_attendance_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home/home_category_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home/home_quick_info_widget.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends DashboardScreen {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: const Column(
        children: [
          HomeQuickInformationWidget(),
          HomeAttendanceWidget(),
          HomeCategoryWidget(),
          HomeAnnouncementWidget(),
        ],
      ).withVerticalSpacing(24),
    );
  }
}
