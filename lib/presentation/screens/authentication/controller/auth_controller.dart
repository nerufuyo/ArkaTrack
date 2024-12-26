import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/services/secure_storage_services.dart';
import 'package:arkatrack/common/utils/validator.dart';
import 'package:arkatrack/domain/repositories/firebase_repository.dart';
import 'package:arkatrack/presentation/widgets/app_dialog_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final SecureStorageServices secureStorageServices =
      Get.find<SecureStorageServices>();
  final FirebaseRepository firebaseRepository = FirebaseRepository();

  final isPasswordVisible = false.obs;
  final selectedPageValue = 0.obs;

  // Form validation
  final emailErrorText = ''.obs;
  final passwordErrorText = ''.obs;
  final confirmPasswordErrorText = ''.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  void changeSelectedPageValue() {
    selectedPageValue.value = selectedPageValue.value == 0 ? 1 : 0;
  }

  void emailPasswordSignInAndSignUp() {
    final validator = Validator();

    // Validate email and password
    validator.validateEmail(emailController, emailErrorText);
    validator.validatePassword(passwordController, passwordErrorText);

    // Validate confirm password only for sign-up
    if (selectedPageValue.value == 1) {
      validator.validateConfirmPassword(
        confirmPasswordController,
        passwordController,
        confirmPasswordErrorText,
      );
    }

    // Check for errors
    final hasNoErrors = emailErrorText.value.isEmpty &&
        passwordErrorText.value.isEmpty &&
        (selectedPageValue.value == 0 ||
            confirmPasswordErrorText.value.isEmpty);

    // Navigate if no errors
    if (hasNoErrors) {
      if (selectedPageValue.value == 0) {
        signInWithEmailAndPassword();
      } else {
        signUpWithEmailAndPassword();
      }
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    final status = await firebaseRepository.signUpWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    status.fold(
      (error) {
        if (error == 'The account already exists for that email.') {
          emailErrorText.value = error;
        } else if (error == 'The password provided is too weak.') {
          passwordErrorText.value = error;
        }
      },
      (user) async {
        await secureStorageServices.writeSecureData('userId', user.uid);
        showDialog(
          context: globalKey.currentContext!,
          builder: (context) => const AppDialogInfoWidget(
            type: AppDialogInfoType.success,
            title: 'Success',
            message: 'User signed up successfully',
          ),
        );

        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.canPop(globalKey.currentContext!)) {
            Navigator.pop(globalKey.currentContext!);
          }
          selectedPageValue.value = 0;
        });
      },
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    final status = await firebaseRepository.signInWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    status.fold(
      (error) {
        if (error == 'No user found for that email.') {
          emailErrorText.value = error;
        } else if (error == 'Wrong password provided for that user.') {
          passwordErrorText.value = error;
        }
      },
      (user) async {
        await secureStorageServices.writeSecureData('userId', user.uid);
        showDialog(
          context: globalKey.currentContext!,
          builder: (context) => const AppDialogInfoWidget(
            type: AppDialogInfoType.success,
            title: 'Success',
            message: 'User signed in successfully',
          ),
        );

        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.canPop(globalKey.currentContext!)) {
            Navigator.pop(globalKey.currentContext!);
          }
          GoRouter.of(globalKey.currentContext!).go(ScreenRouter.dashboard);
        });
      },
    );
  }

  void togglePasswordVisibility(index) {
    if (index != 0) {
      isPasswordVisible.value = !isPasswordVisible.value;
    }
  }
}
