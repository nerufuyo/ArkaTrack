import 'package:arkatrack/presentation/screens/authentication/controller/auth_controller.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/divider_text_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/auth_form_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/social_signin_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/welcome_text_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends GetView<AuthController> {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              const Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: AppTypography(
                    text: '© 2024 ArkaTrack. All Rights Reserved.',
                    fontSize: AppFontSize.small,
                    color: AppColors.grey,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.075,
                right: MediaQuery.of(context).size.width * 0.075,
                child: InkWell(
                  onTap: () => controller.changeSelectedPageValue(),
                  child: AppTypography(
                    text: controller.selectedPageValue.value == 0
                        ? 'Sign Up'
                        : 'Sign In',
                    fontSize: AppFontSize.medium,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppNameWidget(fontSize: 40),
                    WelcomeTextWidget(),
                    AuthFormWidget(),
                    DividerTextWidget(),
                    SocialSignInWidget(),
                  ],
                ).withVerticalSpacing(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
