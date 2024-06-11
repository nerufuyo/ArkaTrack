import 'package:arkatrack/style/color.dart';
import 'package:arkatrack/style/typography.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatefulWidget {
  const AppButtonWidget({
    super.key,
    required this.onClicked,
    this.width,
    this.height,
    this.buttonText,
    this.buttonIcon,
    this.isIconLeft,
    this.isIconRight,
    this.buttonColor,
    this.buttonBorderColor,
    this.textColor,
  });

  final Function? onClicked;
  final double? width;
  final double? height;
  final String? buttonText;
  final String? buttonIcon;
  final bool? isIconLeft;
  final bool? isIconRight;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final Color? textColor;

  @override
  State<AppButtonWidget> createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onClicked != null) {
          widget.onClicked!();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.buttonColor ?? AppColors.primary,
          border: Border.all(
            color: widget.buttonBorderColor ?? AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget.buttonIcon == ''
            ? AppTypography(
                text: widget.buttonText ?? 'Try Again',
                fontSize: AppFontSize.large,
                fontWeight: FontWeight.bold,
                color: widget.textColor ?? AppColors.white,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isIconLeft == true) ...[
                    Image.asset(
                      widget.buttonIcon!,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                  ],
                  AppTypography(
                    text: widget.buttonText ?? 'Try Again',
                    fontSize: AppFontSize.large,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor ?? AppColors.white,
                  ),
                  if (widget.isIconRight == true) ...[
                    const SizedBox(width: 8),
                    Image.asset(
                      widget.buttonIcon!,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
