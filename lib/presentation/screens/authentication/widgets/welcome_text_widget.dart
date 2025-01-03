import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeTextWidget extends AuthenticationScreen {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Column(
          children: List.generate(
            2,
            (colIndex) => AppTypography(
              text: controller.selectedPageValue.value == 0
                  ? colIndex == 0
                      ? 'Welcome Back'
                      : 'Please sign in to process your attendance request'
                  : colIndex == 0
                      ? 'Welcome to ArkaTrack'
                      : 'Please sign up to use our services',
              fontSize: colIndex == 0
                  ? AppFontSize.extraExtraExtraLarge
                  : AppFontSize.large,
              fontWeight: colIndex == 0 ? FontWeight.bold : FontWeight.normal,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ).withVerticalSpacing(4),
      ),
    );
  }
}
