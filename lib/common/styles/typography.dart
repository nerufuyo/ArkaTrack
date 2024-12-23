import 'package:arkatrack/common/styles/color.dart';
import 'package:flutter/material.dart';

class AppFontStyle {
  static const String poppinsBlack = 'assets/fonts/Poppins-Black.ttf';
  static const String poppinsBlackItalic =
      'assets/fonts/Poppins-BlackItalic.ttf';
  static const String poppinsBold = 'assets/fonts/Poppins-Bold.ttf';
  static const String poppinsBoldItalic = 'assets/fonts/Poppins-BoldItalic.ttf';
  static const String poppinsExtraBold = 'assets/fonts/Poppins-ExtraBold.ttf';
  static const String poppinsExtraBoldItalic =
      'assets/fonts/Poppins-ExtraBoldItalic.ttf';
  static const String poppinsExtraLight = 'assets/fonts/Poppins-ExtraLight.ttf';
  static const String poppinsExtraLightItalic =
      'assets/fonts/Poppins-ExtraLightItalic.ttf';
  static const String poppinsItalic = 'assets/fonts/Poppins-Italic.ttf';
  static const String poppinsLight = 'assets/fonts/Poppins-Light.ttf';
  static const String poppinsLightItalic =
      'assets/fonts/Poppins-LightItalic.ttf';
  static const String poppinsMedium = 'assets/fonts/Poppins-Medium.ttf';
  static const String poppinsMediumItalic =
      'assets/fonts/Poppins-MediumItalic.ttf';
  static const String poppinsRegular = 'assets/fonts/Poppins-Regular.ttf';
  static const String poppinsSemiBold = 'assets/fonts/Poppins-SemiBold.ttf';
  static const String poppinsSemiBoldItalic =
      'assets/fonts/Poppins-SemiBoldItalic.ttf';
  static const String poppinsThin = 'assets/fonts/Poppins-Thin.ttf';
  static const String poppinsThinItalic = 'assets/fonts/Poppins-ThinItalic.ttf';
}

class AppFontSize {
  static const double extraSmall = 10.0;
  static const double small = 12.0;
  static const double medium = 14.0;
  static const double large = 16.0;
  static const double extraLarge = 18.0;
  static const double extraExtraLarge = 20.0;
  static const double extraExtraExtraLarge = 22.0;
}

class AppTypography extends StatelessWidget {
  const AppTypography({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily ?? AppFontStyle.poppinsRegular,
        fontSize: fontSize ?? AppFontSize.medium,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.black,
      ),
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
