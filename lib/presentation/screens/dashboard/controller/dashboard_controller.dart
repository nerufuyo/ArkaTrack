import 'dart:developer';

import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/domain/models/user_model.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DashboardController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();
  final FirebaseRepository firebaseRepository = FirebaseRepository();

  final RxInt selectedPageValue = 0.obs;
  final Rx<UserModel> userData = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final currentUser = firebaseRepository.currentUser;
    log('currentUser: $currentUser');

    if (currentUser != null) {
      userData.value = UserModel.fromUser(currentUser);
    }
  }

  void logout() async {
    Future.wait([
      secureStorageServices.deleteSecureData('userId'),
      firebaseRepository.signOut(),
    ]).then((value) =>
        GoRouter.of(globalKey.currentContext!).goNamed(ScreenName.auth));
  }
}
