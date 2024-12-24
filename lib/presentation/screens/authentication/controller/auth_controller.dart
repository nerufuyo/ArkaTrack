import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final selectedPageValue = 0.obs;
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
      GoRouter.of(globalKey.currentContext!).goNamed(ScreenName.dashboard);
    }
  }

  void googleSignIn() {
    // Google sign-in logic
  }

  void appleSignIn() {
    // Apple sign-in logic
  }
}
