import 'package:arkatrack/domain/models/user_model.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final FirebaseRepository firebaseRepository = FirebaseRepository();

  final Rx<UserModel> userData = UserModel().obs;
  final RxString imageUrl = ''.obs;
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final currentUser = firebaseRepository.currentUser;
    if (currentUser != null) {
      userData.value = UserModel.fromUser(currentUser);
    }
  }
}
