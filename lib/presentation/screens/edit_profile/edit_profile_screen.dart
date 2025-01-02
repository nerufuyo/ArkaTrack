import 'package:arkatrack/common/routes/route.dart';
import 'package:arkatrack/presentation/screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/presentation/widgets/app_min_header_widget.dart';
import 'package:arkatrack/presentation/widgets/app_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppMinimalisHeaderWidget(
          title: 'Edit Profile',
          onBack: () => GoRouter.of(context).goNamed(ScreenName.dashboard),
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
                  hintText: data.hintText,
                  titleText: data.title,
                  controller: data.controller,
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
