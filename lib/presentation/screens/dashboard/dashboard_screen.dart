import 'package:arkatrack/presentation/widgets/app_alert_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppNameWidget(fontSize: 24),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => const AppAlertWidget(
                    title: 'Under Maintenance',
                    content:
                        'This feature is under maintenance. Please try again later.',
                  ),
                ),
                child: Image.asset(
                  LocalIcons().bellIcon,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: dashboardItems.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.w500,
        ),
        items: List.generate(
          bottomNavigationItems.length,
          (index) => BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavigationItems[index]['icon'],
              width: 28,
            ),
            activeIcon: Image.asset(
              bottomNavigationItems[index]['iconActive'],
              width: 28,
            ),
            label: bottomNavigationItems[index]['label'],
          ),
        ),
      ),
    );
  }
}
