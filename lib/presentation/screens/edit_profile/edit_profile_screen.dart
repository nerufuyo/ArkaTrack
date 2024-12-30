import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/presentation/screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/presentation/widgets/app_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTypography(
          text: 'Edit Profile',
          fontSize: AppFontSize.large,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => GoRouter.of(globalKey.currentContext!)
              .goNamed(ScreenName.dashboard),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getProfileData().length,
              itemBuilder: (context, index) {
                final data = controller.getProfileData()[index];
                return AppTextFieldWidget(
                  hintText: data['hintText'],
                  titleText: data['title'],
                  controller: data['controller'].value,
                );
              },
            ),
            AppButtonWidget(
              onClicked: () => controller.updateProfile(),
              buttonText: 'Save',
            )
          ],
        ),
      ),
    );
  }
}
