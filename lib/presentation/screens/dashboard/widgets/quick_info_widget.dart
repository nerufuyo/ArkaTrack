import 'package:arkatrack/common/extensions/row_extension.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickInformationWidget extends HomeWidget {
  const QuickInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary,
                backgroundImage: AssetImage(LocalImages().arkademiProfile),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (colIndex) => AppTypography(
                    text: colIndex == 0
                        ? controller.userData.value.displayName ?? 'User'
                        : controller.userData.value.email ?? 'No Role',
                    fontSize:
                        colIndex == 0 ? AppFontSize.medium : AppFontSize.small,
                    fontWeight:
                        colIndex == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ).withVerticalSpacing(2),
            ],
          ).withHorizontalSpacing(8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTypography(
                text: 'Monday, 20 Sep 2021',
                fontSize: AppFontSize.medium,
                fontWeight: FontWeight.bold,
              ),
              AppTypography(
                text: '08:30:15 WIB ',
                fontSize: AppFontSize.small,
                color: AppColors.black,
              ),
            ],
          ).withVerticalSpacing(2),
        ],
      ),
    );
  }
}
