import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validator {
  void validateEmail(
    Rx<TextEditingController> emailController,
    RxString emailErrorText,
  ) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (emailController.value.text.isEmpty) {
      emailErrorText.value = 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(emailController.value.text)) {
      emailErrorText.value = 'Invalid email format';
    } else {
      emailErrorText.value = '';
    }
  }

  void validatePassword(
    Rx<TextEditingController> passwordController,
    RxString passwordErrorText,
  ) {
    if (passwordController.value.text.isEmpty) {
      passwordErrorText.value = 'Password cannot be empty';
    } else {
      passwordErrorText.value = '';
    }
  }

  void validateConfirmPassword(
    Rx<TextEditingController> confirmPasswordController,
    Rx<TextEditingController> passwordController,
    RxString confirmPasswordErrorText,
  ) {
    if (confirmPasswordController.value.text.isEmpty) {
      confirmPasswordErrorText.value = 'Confirm Password cannot be empty';
    } else if (confirmPasswordController.value.text !=
        passwordController.value.text) {
      confirmPasswordErrorText.value = 'Password does not match';
    } else {
      confirmPasswordErrorText.value = '';
    }
  }
}
