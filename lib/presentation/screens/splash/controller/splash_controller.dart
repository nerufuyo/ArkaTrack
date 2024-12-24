import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalImages images = LocalImages();
  final int splashTimer = 3;

  @override
  void onInit() {
    super.onInit();
    timerNavigation();
  }

  Future<void> timerNavigation() async {
    await Future.delayed(
      Duration(seconds: splashTimer),
      () => GoRouter.of(globalKey.currentContext!).goNamed(ScreenName.auth),
    );
  }
}
