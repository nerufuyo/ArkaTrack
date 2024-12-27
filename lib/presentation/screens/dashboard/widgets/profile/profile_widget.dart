import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/presentation/screens/dashboard/controller/profile_controller.dart';
import 'package:arkatrack/presentation/screens/dashboard/widgets/profile/profile_quick_info_widget.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends GetView<ProfileController> {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const ProfileQuickInformationWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTypography(
                  text: 'Preferences',
                  fontSize: AppFontSize.extraLarge,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Language'),
                        trailing: const Text('English'),
                      ),
                      ListTile(
                        title: const Text('Theme'),
                        trailing: const Text('Light'),
                      ),
                    ],
                  ),
                ),
                AppButtonWidget(
                  onClicked: () {},
                  buttonText: 'Delete Account',
                  buttonColor: Colors.transparent,
                  buttonBorderColor: Colors.red,
                  textColor: Colors.red,
                ),
                AppButtonWidget(
                  onClicked: () => controller.logout(),
                  buttonText: 'Logout',
                  buttonColor: Colors.red,
                  buttonBorderColor: Colors.red,
                )
              ],
            ).withVerticalSpacing(8),
          ],
        ).withVerticalSpacing(40),
      ),
    );
  }
}
