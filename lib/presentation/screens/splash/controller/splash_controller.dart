import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();
  final LocalImages images = LocalImages();

  final RxString userId = ''.obs;
  final int splashTimer = 3;

  @override
  void onInit() {
    super.onInit();
    screenNavigation();
  }

  Future<void> screenNavigation() async {
    userId.value = await secureStorageServices.readSecureData('userId') ?? '';

    final targetScreen =
        userId.value.isNotEmpty ? ScreenName.dashboard : ScreenName.auth;

    await Future.delayed(Duration(seconds: splashTimer), () {
      GoRouter.of(globalKey.currentContext!).goNamed(targetScreen);
    });
  }
}
