import 'package:arkatrack/presentation/screens/splash/controller/splash_controller.dart';
import 'package:arkatrack/presentation/screens/splash/widgets/animated_logo_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/route.dart';
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

  @override
  void initState() {
    super.initState();
    controller.timerNavigation(context, splashTimer, ScreenRouter.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedLogoWidget(images: images),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * .875,
              ),
              child: RichText(
                text: TextSpan(
                  children: List.generate(
                    2,
                    (i) {
                      return TextSpan(
                        text: i == 0 ? 'Arka' : 'Track',
                        style: TextStyle(
                          color: i == 0 ? AppColors.primary : AppColors.black,
                          fontSize: 48,
                          fontFamily: AppFontStyle.poppinsExtraBold,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: AppTypography(
                text: 'Powered by Arkademi',
                fontSize: AppFontSize.extraLarge,
                fontFamily: AppFontStyle.poppinsExtraBold,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
