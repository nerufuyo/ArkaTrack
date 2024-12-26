import 'package:arkatrack/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class ProfileController extends DashboardController {
  final RxString name = ''.obs;

  @override
  void onInit() {
    super.onInit();
    name.value = userData.value.email ?? 'User';
  }
}
