import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:flutter/material.dart';

class AppAlertWidget extends StatelessWidget {
  const AppAlertWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppTypography(
        text: title,
        fontSize: AppFontSize.extraExtraLarge,
        fontWeight: FontWeight.bold,
      ),
      content: AppTypography(
        text: content,
        fontSize: AppFontSize.medium,
        maxLines: 2,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const AppTypography(
            text: 'Close',
            fontSize: AppFontSize.large,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
