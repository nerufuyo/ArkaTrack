import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InboxWidget extends StatelessWidget {
  const InboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              LocalLotties().maintenanceAnimation,
              width: 200,
              height: 200,
            ),
            const AppTypography(
              text: 'Under Maintenance',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const AppTypography(
              text:
                  'This feature is under maintenance. Please try again later.',
              fontSize: 16,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ).withVerticalSpacing(16),
      ),
    );
  }
}
