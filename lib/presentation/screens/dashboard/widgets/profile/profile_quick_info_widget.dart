import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/profile/profile_widget.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileQuickInformationWidget extends ProfileWidget {
  const ProfileQuickInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage(controller.imageUrl.value),
        ),
        AppTypography(
          text: controller.name.value,
          fontSize: AppFontSize.extraLarge,
          fontWeight: FontWeight.bold,
        ),
        AppTypography(
          text: controller.email.value,
          fontWeight: FontWeight.w300,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: AppButtonWidget(
            onClicked: () {},
            buttonText: 'Edit Profile',
            fontSize: AppFontSize.small,
            width: context.width * 0.325,
            height: context.height * 0.05,
            padding: 8,
          ),
        )
      ],
    );
  }
}
