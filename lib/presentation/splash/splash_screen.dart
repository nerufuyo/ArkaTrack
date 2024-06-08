import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/general_function.dart';
import 'package:arkatrack/utils/route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalImages images = LocalImages();
  final int splashTimer = 2;

  @override
  void initState() {
    super.initState();
    // timerNavigation(
    //   context,
    //   splashTimer,
    //   ScreenRouter.dashboard,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 28,
                ),
                borderRadius: BorderRadius.circular(400),
                color: AppColors.white,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            ),
          ),
          Center(
            child: Image.asset(
              images.arkademiLogo,
              width: 200,
              height: 200,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: AppTypography(
                text: 'Powered by Arkademi',
                fontSize: AppFontSize.extraLarge,
                fontFamily: AppFontStyle.poppinsBold,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
