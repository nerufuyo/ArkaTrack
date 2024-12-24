import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
    this.fontSize,
  });

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: List.generate(
          2,
          (i) {
            return TextSpan(
              text: i == 0 ? 'Arka' : 'Track',
              style: TextStyle(
                color: i == 0 ? AppColors.primary : AppColors.black,
                fontSize: fontSize ?? AppFontSize.extraExtraLarge,
                fontFamily: AppFontStyle.poppinsExtraBold,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
