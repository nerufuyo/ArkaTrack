import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatefulWidget {
  AppTextFieldWidget({
    super.key,
    required this.hintText,
    required this.titleText,
    required this.controller,
    this.isPassword,
    this.errorText,
  });

  final String titleText;
  final String? errorText;
  final String hintText;
  final TextEditingController controller;
  bool? isPassword = false;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  final LocalIcons icons = LocalIcons();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTypography(
          text: widget.titleText,
          fontSize: AppFontSize.large,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        TextField(
          controller: widget.controller,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            filled: false,
            hintText: widget.hintText,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 30,
            ),
            errorText: widget.errorText == '' ? null : widget.errorText,
            errorStyle: const TextStyle(
              color: AppColors.error,
              fontSize: 12,
              fontFamily: AppFontStyle.poppinsBlack,
            ),
            suffixIcon: widget.isPassword == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () => setState(
                          () => isPasswordVisible = !isPasswordVisible),
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
