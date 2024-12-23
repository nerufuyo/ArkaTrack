import 'package:arkatrack/presentation/screens/splash/controller/splash_controller.dart';
import 'package:arkatrack/presentation/screens/splash/widgets/animated_logo_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/static/constant.dart';
import 'package:arkatrack/common/routes/route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalImages images = LocalImages();
  final SplashController controller = SplashController();
  final int splashTimer = 3;
  final int selectedPageValue = 0;

  @override
  void initState() {
    super.initState();
    controller.timerNavigation(context, splashTimer, ScreenRouter.auth);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedLogoWidget(images: images),
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
