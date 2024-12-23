import 'package:arkatrack/common/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashController {
  void timerNavigation(
    BuildContext context,
    int duration,
    route,
  ) async {
    await Future.delayed(Duration(seconds: duration), () {
      context.goNamed(ScreenName.auth);
    });
  }
}
