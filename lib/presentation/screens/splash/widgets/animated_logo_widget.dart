import 'package:arkatrack/common/styles/color.dart';
import 'package:arkatrack/common/statics/constant.dart';
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
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.width * 0.55,
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
            width: 160,
            height: 160,
          ),
        ),
      ],
    );
  }
}
