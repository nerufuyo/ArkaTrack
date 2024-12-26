import 'dart:developer';

import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/utils/validator.dart';
import 'package:arkatrack/presentation/widgets/app_dialog_info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final isPasswordVisible = false.obs;
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
      if (selectedPageValue.value == 0) {
        signInWithEmailAndPassword();
      } else {
        signUpWithEmailAndPassword();
      }
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: confirmPasswordController.value.text,
      )
          .then((value) {
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
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        passwordErrorText.value = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        emailErrorText.value = 'The account already exists for that email.';
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      )
          .then((value) {
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
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emailErrorText.value = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        passwordErrorText.value = 'Wrong password provided for that user.';
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  void googleSignIn() {
    // Google sign-in logic
  }

  void appleSignIn() {
    // Apple sign-in logic
  }

  void togglePasswordVisibility(index) {
    if (index != 0) {
      isPasswordVisible.value = !isPasswordVisible.value;
    }
  }
}
