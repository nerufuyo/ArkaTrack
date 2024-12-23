import 'package:arkatrack/presentation/screens/absence/attendance_screen.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:arkatrack/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:arkatrack/presentation/screens/empty/empty_screen.dart';
import 'package:arkatrack/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenRouter {
  static const String error = '/error';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String attendance = '/attendance';
}

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: globalKey,
  routes: [
    GoRoute(
      path: ScreenRouter.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: ScreenRouter.auth,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      path: ScreenRouter.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: ScreenRouter.attendance,
      builder: (context, state) => const AttendanceScreen(),
    ),
    GoRoute(
      path: ScreenRouter.error,
      builder: (context, state) => EmptyScreen(),
    ),
  ],
  errorBuilder: (context, state) => EmptyScreen(),
);
