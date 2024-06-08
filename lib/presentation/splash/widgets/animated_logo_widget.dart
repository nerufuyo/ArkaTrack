import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:flutter/material.dart';

class AnimatedLogoWidget extends StatelessWidget {
  const AnimatedLogoWidget({
    super.key,
    required this.images,
  });

  final LocalImages images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.primary,
            ),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
                width: 28,
              ),
              borderRadius: BorderRadius.circular(400),
              color: AppColors.white,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            images.arkademiLogo,
            width: 200,
            height: 200,
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: AppTypography(
              text: 'Powered by Arkademi',
              fontSize: AppFontSize.extraLarge,
              fontFamily: AppFontStyle.poppinsExtraBold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
