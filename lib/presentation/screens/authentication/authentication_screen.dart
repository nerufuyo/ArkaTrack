import 'package:arkatrack/presentation/screens/authentication/widgets/divider_text_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/auth_form_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/social_signin_widget.dart';
import 'package:arkatrack/presentation/screens/authentication/widgets/welcome_text_widget.dart';
import 'package:arkatrack/presentation/widgets/app_name_widget.dart';
import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/styles/typography.dart';
import 'package:arkatrack/common/extensions/column_extension.dart';
import 'package:arkatrack/common/routes/route.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  int selectedPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
                onTap: () => setState(() {
                  selectedPageValue = selectedPageValue == 0 ? 1 : 0;
                }),
                child: AppTypography(
                  text: selectedPageValue == 0 ? 'Sign Up' : 'Sign In',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppNameWidget(fontSize: 40),
                  WelcomeTextWidget(selectedPageValue: selectedPageValue),
                  AuthFormWidget(
                    buttonClicked: () => Navigator.pushNamed(
                      context,
                      ScreenRouter.dashboard,
                    ),
                    linkClicked: () {},
                    selectedPageValue: selectedPageValue,
                  ),
                  const DividerTextWidget(),
                  SocialSignInWidget(
                    googleSignIn: () {},
                    appleSignIn: () {},
                  ),
                ],
              ).withVerticalSpacing(40),
            ),
          ],
        ),
      ),
    );
  }
}
