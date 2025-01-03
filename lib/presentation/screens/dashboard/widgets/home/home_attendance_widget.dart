import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/home_controller.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeAttendanceWidget extends GetView<HomeController> {
  const HomeAttendanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTypography(
            text: 'Today\'s Attendance',
            fontSize: AppFontSize.extraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          const AppTypography(
            text: 'In Time: 09:00 AM - Out Time: 06:00 PM',
            color: AppColors.black,
            fontSize: AppFontSize.large,
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              2,
              (rowIndex) => AppButtonWidget(
                onClicked: () => GoRouter.of(globalKey.currentContext!).goNamed(
                  ScreenName.attendance,
                ),
                width: MediaQuery.of(context).size.width / 2.5,
                buttonText: rowIndex == 0 ? 'Clock In' : 'Clock Out',
                buttonColor:
                    rowIndex == 0 ? AppColors.primary : AppColors.white,
                buttonBorderColor: AppColors.primary,
                textColor: rowIndex == 0 ? AppColors.white : AppColors.primary,
              ),
            ),
          ),
        ],
      ).withVerticalSpacing(16),
    );
  }
}
