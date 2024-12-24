import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.titleText,
    required this.controller,
    this.isPassword = false,
    this.errorText,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
  });

  final String titleText;
  final String? errorText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    final LocalIcons icons = LocalIcons();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTypography(
          text: titleText,
          fontSize: AppFontSize.large,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        TextField(
          controller: controller,
          obscureText: isPassword && !isPasswordVisible,
          decoration: InputDecoration(
            filled: false,
            hintText: hintText,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 30,
            ),
            errorText: errorText == '' ? null : errorText,
            errorStyle: const TextStyle(
              color: AppColors.error,
              fontSize: 12,
              fontFamily: AppFontStyle.poppinsBlack,
            ),
            suffixIcon: isPassword
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: onTogglePasswordVisibility,
                      child: Image.asset(
                        isPasswordVisible ? icons.eyeHideIcon : icons.eyeIcon,
                        width: 8,
                      ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
