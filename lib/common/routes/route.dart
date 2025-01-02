import 'package:arkatrack/common/services/date_services.dart';
import 'package:arkatrack/common/services/location_services.dart';
import 'package:arkatrack/common/services/permission_services.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/presentation/screens/absence/attendance_screen.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:arkatrack/presentation/screens/authentication/controller/auth_controller.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/home_controller.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/profile_controller.dart';
import 'package:arkatrack/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:arkatrack/presentation/screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:arkatrack/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:arkatrack/presentation/screens/empty/empty_screen.dart';
import 'package:arkatrack/presentation/screens/splash/controller/splash_controller.dart';
import 'package:arkatrack/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenName {
  static const String error = 'error';
  static const String splash = 'splash';
  static const String auth = 'auth';
  static const String dashboard = 'dashboard';
  static const String attendance = 'attendance';
  static const String editProfile = 'editProfile';
}

class ScreenRouter {
  static const String error = '/error';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String attendance = '/attendance';
  static const String editProfile = '/edit-profile';
}

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: globalKey,
  initialLocation: ScreenRouter.splash,
  routes: [
    GoRoute(
      name: ScreenName.splash,
      path: ScreenRouter.splash,
      builder: (context, state) {
        Get.put(DevicePermissionServices());
        Get.put(SecureStorageServices());
        Get.put(DateServices());
        Get.put(LocationServices());
        Get.put(SplashController());
        return const SplashScreen();
      },
      onExit: (context, state) => Get.delete<SplashController>(),
    ),
    GoRoute(
      name: ScreenName.auth,
      path: ScreenRouter.auth,
      builder: (context, state) {
        Get.put(AuthController());
        return const AuthenticationScreen();
      },
    ),
    GoRoute(
      name: ScreenName.dashboard,
      path: ScreenRouter.dashboard,
      builder: (context, state) {
        Get.put(DashboardController());
        Get.put(HomeController());
        Get.put(ProfileController());
        return const DashboardScreen();
      },
    ),
    GoRoute(
      name: ScreenName.attendance,
      path: ScreenRouter.attendance,
      builder: (context, state) => const AttendanceScreen(),
    ),
    GoRoute(
      name: ScreenName.editProfile,
      path: ScreenRouter.editProfile,
      builder: (context, state) {
        Get.put(EditProfileController());
        return const EditProfileScreen();
      },
    ),
    GoRoute(
      name: ScreenName.error,
      path: ScreenRouter.error,
      builder: (context, state) => EmptyScreen(),
    ),
  ],
  errorBuilder: (context, state) => EmptyScreen(),
);
