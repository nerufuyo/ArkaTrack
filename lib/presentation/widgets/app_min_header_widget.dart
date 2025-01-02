import 'package:arkatrack/common/styles/typography.dart';
import 'package:flutter/material.dart';

class AppMinimalisHeaderWidget extends StatelessWidget {
  const AppMinimalisHeaderWidget({
    super.key,
    required this.title,
    required this.onBack,
  });

  final String title;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppTypography(
        text: title,
        fontSize: AppFontSize.large,
        fontWeight: FontWeight.bold,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: onBack,
      ),
    );
  }
}
