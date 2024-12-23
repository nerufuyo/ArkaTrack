import 'package:arkatrack/presentation/screens/dashboard/widgets/announcement_list_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/attendance_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/category_list_widget.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/quick_info_widget.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: const Column(
        children: [
          QuickInformationWidget(
            employeeName: 'John Doe',
            employeeRole: 'Software Engineer',
          ),
          AttendanceWidget(),
          CategoryListsWidget(),
          AnnouncementListWidget(),
        ],
      ).withVerticalSpacing(24),
    );
  }
}
