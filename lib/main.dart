import 'package:arkatrack/presentation/screens/absence/attendance_screen.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:arkatrack/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:arkatrack/presentation/screens/empty/empty_screen.dart';
import 'package:arkatrack/presentation/screens/splash/splash_screen.dart';
import 'package:arkatrack/common/static/constant.dart';
import 'package:arkatrack/common/routes/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final StaticText text = StaticText();
  final ScreenRouter router = ScreenRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: text.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: ScreenRouter.splash,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case ScreenRouter.splash:
              return const SplashScreen();
            case ScreenRouter.auth:
              return const AuthenticationScreen();
            case ScreenRouter.dashboard:
              return const DashboardScreen();
            case ScreenRouter.attendance:
              return const AttendanceScreen();
            case ScreenRouter.error:
              return EmptyScreen();

            default:
              return EmptyScreen();
          }
        },
      ),
    );
  }
}
