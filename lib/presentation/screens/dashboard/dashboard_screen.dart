import 'package:arkatrack/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:arkatrack/presentation/widgets/app_alert_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        body: dashboardItems.elementAt(controller.selectedPageValue.value),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: controller.selectedPageValue.value,
          onTap: (index) => controller.selectedPageValue.value = index,
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
                width: 24,
              ),
              activeIcon: Image.asset(
                bottomNavigationItems[index]['iconActive'],
                width: 24,
              ),
              label: bottomNavigationItems[index]['label'],
            ),
          ),
        ),
      ),
    );
  }
}
