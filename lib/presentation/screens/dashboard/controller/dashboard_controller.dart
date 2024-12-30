import 'dart:async';
import 'dart:developer';

import 'package:arkatrack/common/services/date_services.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/domain/models/user_model.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();

  final FirebaseRepository firebaseRepository = FirebaseRepository();

  final RxInt selectedPageValue = 0.obs;
  final RxString formattedTime = ''.obs;
  final Rx<UserModel> userData = UserModel().obs;

  DateTime? date;
  Timer? _timer;

  final DateServices dateServices = Get.find<DateServices>();

  @override
  void onInit() {
    super.onInit();
    startTimeUpdate();
    getData();
  }

  void startTimeUpdate() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      DateTime now = DateTime.now();
      String time = dateServices.getFormattedTime(now);
      formattedTime.value = time;
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
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
