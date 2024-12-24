import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/presentation/widgets/app_textfield_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthFormWidget extends AuthenticationScreen {
  const AuthFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Column(
            children: List.generate(
              controller.selectedPageValue.value == 0 ? 2 : 3,
              (colIndex) {
                String titleText;
                String hintText;
                bool isPassword = false;

                if (colIndex == 0) {
                  titleText = 'Email';
                  hintText = 'Enter your email';
                  isPassword = false;
                } else if (colIndex == 1) {
                  titleText = 'Password';
                  hintText = 'Enter your password';
                  isPassword = true;
                } else {
                  titleText = 'Confirm Password';
                  hintText = 'Re-enter your password';
                  isPassword = true;
                }

                return AppTextFieldWidget(
                  titleText: titleText,
                  hintText: hintText,
                  controller: colIndex == 0
                      ? controller.emailController.value
                      : colIndex == 1
                          ? controller.passwordController.value
                          : controller.confirmPasswordController.value,
                  errorText: colIndex == 0
                      ? controller.emailErrorText.value
                      : colIndex == 1
                          ? controller.passwordErrorText.value
                          : controller.confirmPasswordErrorText.value,
                  onTogglePasswordVisibility: () =>
                      controller.togglePasswordVisibility(colIndex),
                  isPasswordVisible: controller.isPasswordVisible.value,
                  isPassword: isPassword,
                );
              },
            ),
          ).withVerticalSpacing(16),
          if (controller.selectedPageValue.value == 0)
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: const AppTypography(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ),
          AppButtonWidget(
            onClicked: () => controller.emailPasswordSignInAndSignUp(),
            buttonText:
                controller.selectedPageValue.value == 0 ? 'Sign In' : 'Sign Up',
          ),
        ],
      ).withVerticalSpacing(24),
    );
  }
}
