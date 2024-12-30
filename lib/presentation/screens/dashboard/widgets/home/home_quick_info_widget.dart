import 'package:arkatrack/common/extensions/row_extension.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeQuickInformationWidget extends HomeWidget {
  const HomeQuickInformationWidget({super.key});

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
                        : controller.userData.value.role ?? 'No Role',
                    fontSize:
                        colIndex == 0 ? AppFontSize.medium : AppFontSize.small,
                    fontWeight:
                        colIndex == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ).withVerticalSpacing(2),
            ],
          ).withHorizontalSpacing(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTypography(
                text: controller.dateServices.getFormattedDate(),
                fontSize: AppFontSize.medium,
                fontWeight: FontWeight.bold,
              ),
              AppTypography(
                text: controller.formattedTime.value,
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
