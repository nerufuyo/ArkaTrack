import 'package:arkatrack/common/extensions/row_extension.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';

class QuickInformationWidget extends StatelessWidget {
  const QuickInformationWidget({
    super.key,
    required this.employeeName,
    required this.employeeRole,
  });

  final String employeeName;
  final String employeeRole;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  text: colIndex == 0 ? employeeName : employeeRole,
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
    );
  }
}
