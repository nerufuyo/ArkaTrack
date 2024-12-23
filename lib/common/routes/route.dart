import 'package:arkatrack/presentation/screens/absence/attendance_screen.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:arkatrack/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:arkatrack/presentation/screens/empty/empty_screen.dart';
import 'package:arkatrack/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenName {
  static const String error = 'error';
  static const String splash = 'splash';
  static const String auth = 'auth';
  static const String dashboard = 'dashboard';
  static const String attendance = 'attendance';
}

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
  initialLocation: ScreenRouter.splash,
  routes: [
    GoRoute(
      name: ScreenName.splash,
      path: ScreenRouter.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: ScreenName.auth,
      path: ScreenRouter.auth,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      name: ScreenName.dashboard,
      path: ScreenRouter.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      name: ScreenName.attendance,
      path: ScreenRouter.attendance,
      builder: (context, state) => const AttendanceScreen(),
    ),
    GoRoute(
      name: ScreenName.error,
      path: ScreenRouter.error,
      builder: (context, state) => EmptyScreen(),
    ),
  ],
  errorBuilder: (context, state) => EmptyScreen(),
);
