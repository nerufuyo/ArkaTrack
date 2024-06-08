import 'package:arkatrack/presentation/splash/controller/splash_controller.dart';
import 'package:arkatrack/presentation/splash/widgets/animated_logo_widget.dart';
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
    controller.timerNavigation(context, splashTimer, ScreenRouter.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AnimatedLogoWidget(images: images));
  }
}
