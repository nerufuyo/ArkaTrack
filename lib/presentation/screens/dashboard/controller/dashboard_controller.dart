import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();

  final RxInt selectedPageValue = 0.obs;
  final RxString userId = ''.obs;
  final RxString userName = ''.obs;
  final RxString userRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserId();
  }

  void getUserId() async {
    userId.value = await secureStorageServices.readSecureData('userId') ?? '';
  }
}
