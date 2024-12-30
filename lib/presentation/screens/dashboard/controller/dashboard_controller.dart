import 'dart:developer';

import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/domain/models/user_model.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:get/get.dart';

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
    final userId = await secureStorageServices.readSecureData('userId');
    final currentUser = await firebaseRepository.getUserData(userId.toString());

    currentUser.fold(
      (error) => log('Error: $error'),
      (user) => userData.value = user,
    );
  }
}
