import 'package:e_book/utils/font_style_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils/app_text.dart';
import '../utils/color_utils.dart';
import '../utils/decoration_utils.dart';
import '../utils/typedef_utils.dart' as tpdf;

class CustomBtn extends StatelessWidget {
  final tpdf.OnTab? onTap;
  final String title;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? bgColor;
  final Color? textColor;

  const CustomBtn({
    super.key,
    required this.title,
    this.onTap,
    this.radius,
    this.height,
    this.width,
    this.fontSize,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius ?? 40),
      // hoverColor: ColorUtils.transparentColor,
      // splashColor: ColorUtils.transparentColor,
      // highlightColor: ColorUtils.transparentColor,
      child: Ink(
        height: height ?? 55,
        width: width ?? Get.width,
        decoration: containerDecoration(
          color: bgColor ?? ColorUtils.primary,
          borderRadius: BorderRadius.circular(radius ?? 40),
        ),
        child: Center(
          child: AppText(
            title,
            fontSize: fontSize ?? 15,
            color: textColor ?? ColorUtils.white,
            fontWeight: FontWeightClass.fontWeight700,
          ),
        ),
      ),
    );
  }
}
