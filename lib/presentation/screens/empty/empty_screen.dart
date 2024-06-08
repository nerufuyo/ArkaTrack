import 'package:arkatrack/presentation/widgets/app_button_widget.dart';
import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:arkatrack/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatelessWidget {
  EmptyScreen({
    super.key,
    this.errorMessage,
    this.onClicked,
  });

  final LocalIcons icons = LocalIcons();
  final LocalLotties lotties = LocalLotties();
  final String? errorMessage;
  final Function? onClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              lotties.emptyAnimation,
              width: MediaQuery.of(context).size.width * .75,
            ),
            AppTypography(
              text: errorMessage ??
                  'The page you are looking for is not available. Please try again later.',
              fontSize: AppFontSize.large,
              color: AppColors.black,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
            AppButtonWidget(
              onClicked: onClicked,
              buttonIcon: icons.backIcon,
              isIconLeft: true,
            ),
          ],
        ).withVerticalSpacing(24),
      ),
    );
  }
}
