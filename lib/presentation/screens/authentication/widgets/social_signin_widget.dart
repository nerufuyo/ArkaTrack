import 'package:arkatrack/common/extensions/row_extension.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/statics/constant.dart';
import 'package:arkatrack/presentation/screens/authentication/authentication_screen.dart';
import 'package:flutter/material.dart';

class SocialSignInWidget extends AuthenticationScreen {
  const SocialSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        loginSocialItems.length,
        (rowIndex) => InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              loginSocialItems[rowIndex]['icon'],
              width: 36,
              height: 36,
            ),
          ),
        ),
      ),
    ).withHorizontalSpacing(24);
  }
}
