import 'package:arkatrack/presentation/splash/splash_screen.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

            default:
              return Scaffold(
                body: Center(
                  child: Lottie.asset(
                    'assets/lotties/empty_animation.json',
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
