import 'package:flutter/material.dart';

class SplashController {
  void timerNavigation(
    BuildContext context,
    int duration,
    route,
  ) async {
    await Future.delayed(Duration(seconds: duration), () {
      Navigator.pushNamed(context, route);
    });
  }
}
