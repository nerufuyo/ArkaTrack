import 'dart:developer';

import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/domain/models/profile_field_model.dart';
import 'package:arkatrack/domain/models/user_model.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EditProfileController extends GetxController {
  final LocalImages images = LocalImages();
  final FirebaseRepository firebaseRepository = FirebaseRepository();
  final SecureStorageServices secureStorageServices = SecureStorageServices();

  final Rx<UserModel> userData = UserModel().obs;
  final RxString imageUrl = ''.obs;
  final name = TextEditingController().obs;
  final email = TextEditingController().obs;
  final role = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  List<ProfileField> getProfileData() {
    return [
      ProfileField(
        title: 'Name',
        controller: name.value,
        hintText: 'Enter your name',
      ),
      ProfileField(
        title: 'Email',
        controller: email.value,
        hintText: 'Enter your email',
      ),
      ProfileField(
        title: 'Role',
        controller: role.value,
        hintText: 'Enter your role',
      ),
    ];
  }

  void getData() async {
    final userId = await secureStorageServices.readSecureData('userId');
    final currentUser = await firebaseRepository.getUserData(userId.toString());

    currentUser.fold(
      (error) => log('Error: $error'),
      (user) {
        userData.value = user;
        name.value.text = user.displayName ?? '';
        email.value.text = user.email ?? '';
        imageUrl.value = user.photoURL ?? images.arkademiProfile;
        role.value.text = user.role ?? '';
      },
    );
  }

  void updateProfile() async {
    final currentUser = firebaseRepository.currentUser;
    if (currentUser != null) {
      final userData = await firebaseRepository.updateProfile(
        displayName: name.value.text,
        photoURL: imageUrl.value,
        email: email.value.text,
        role: role.value.text,
      );

      userData.fold(
        (error) => log('Update Profile: Error | $error'),
        (user) async {
          user = UserModel.fromUser(currentUser);
          log('Update Profile: Success! | User: $user');
          GoRouter.of(globalKey.currentContext!).goNamed(ScreenName.dashboard);
        },
      );
    }
  }
}
