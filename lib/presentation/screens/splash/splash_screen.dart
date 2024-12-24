import 'package:arkatrack/presentation/screens/splash/controller/splash_controller.dart';
import 'package:arkatrack/presentation/screens/splash/widgets/animated_logo_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedLogoWidget(images: controller.images),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .75,
                ),
                child: const AppNameWidget(fontSize: 40),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: AppTypography(
                  text: 'Powered by Arkademi',
                  fontSize: AppFontSize.large,
                  fontFamily: AppFontStyle.poppinsExtraBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
