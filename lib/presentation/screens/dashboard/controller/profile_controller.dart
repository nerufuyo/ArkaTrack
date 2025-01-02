import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileController extends GetxController {
  final DashboardController dashboardController =
      Get.find<DashboardController>();
  final LocalImages images = LocalImages();

  final FirebaseRepository firebaseRepository = FirebaseRepository();
  final SecureStorageServices secureStorageServices = SecureStorageServices();

  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString imageUrl = ''.obs;
  final RxString role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () => getUserData());
  }

  void getUserData() async {
    name.value = dashboardController.userData.value.displayName ?? '';
    email.value = dashboardController.userData.value.email ?? '';
    imageUrl.value =
        dashboardController.userData.value.photoURL ?? images.arkademiProfile;
    role.value = dashboardController.userData.value.role ?? '';
  }

  void logout() async {
    showDialog(
      context: globalKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async => Future.wait([
              secureStorageServices.deleteSecureData('userId'),
              firebaseRepository.signOut(),
            ]).then((value) => GoRouter.of(globalKey.currentContext!)
                .goNamed(ScreenName.auth)),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
