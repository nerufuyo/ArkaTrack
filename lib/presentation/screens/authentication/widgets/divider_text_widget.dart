import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:flutter/material.dart';

class DividerTextWidget extends StatelessWidget {
  const DividerTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 1,
          color: AppColors.grey,
        ),
        const AppTypography(
          text: 'OR',
          fontSize: 14,
          color: AppColors.grey,
        ),
        Container(
          width: 100,
          height: 1,
          color: AppColors.grey,
        ),
      ],
    );
  }
}
