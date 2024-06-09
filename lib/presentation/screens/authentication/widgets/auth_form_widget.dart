import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/presentation/widgets/app_textfield_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/extension.dart';
import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({
    super.key,
    required this.buttonClicked,
    required this.selectedPageValue,
    required this.linkClicked,
  });

  final Function() buttonClicked;
  final Function() linkClicked;
  final int selectedPageValue;

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  late List<TextEditingController> controllers;
  late List<String> errorTexts;

  void generateControllers() {
    controllers = List.generate(
      widget.selectedPageValue == 0 ? 2 : 3,
      (index) => TextEditingController(),
    );
    errorTexts = List.generate(
      widget.selectedPageValue == 0 ? 2 : 3,
      (index) => '',
    );
  }

  @override
  void dispose() {
    for (var element in controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            widget.selectedPageValue == 0 ? 2 : 3,
            (colIndex) {
              generateControllers();

              String titleText;
              String hintText;
              bool isPassword = false;

              if (colIndex == 0) {
                titleText = 'Email';
                hintText = 'Enter your email';
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
                controller: controllers[colIndex],
                errorText: errorTexts[colIndex],
                isPassword: isPassword,
              );
            },
          ),
        ).withVerticalSpacing(16),
        if (widget.selectedPageValue == 0)
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => setState(() => widget.linkClicked()),
              child: const AppTypography(
                text: 'Forgot Password?',
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
          ),
        AppButtonWidget(
          onClicked: () {
            if (widget.selectedPageValue == 0) {
              widget.buttonClicked();
            } else {
              if (controllers[1].text == controllers[2].text) {
                widget.buttonClicked();
              } else {
                setState(() {
                  errorTexts[2] = 'Passwords do not match';
                });
              }
            }
          },
          buttonText: widget.selectedPageValue == 0 ? 'Sign In' : 'Sign Up',
        ),
      ],
    ).withVerticalSpacing(24);
  }
}
