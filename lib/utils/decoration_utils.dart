import 'package:flutter/material.dart';

import 'color_utils.dart';

class DecorationUtils {
  /// DRAWER
  static BoxDecoration drawerUserInfo({required BorderRadius borderRadius}) {
    return containerDecoration(borderRadius: borderRadius);
  }

  /// SHADOW
  static List<BoxShadow> minorShadow = [
    BoxShadow(
      color: ColorUtils.black26.withOpacity(0.2),
      blurRadius: 2,
      offset: const Offset(2, 2),
      spreadRadius: 2,
    )
  ];
}

BoxDecoration containerDecoration({
  Color? color,
  BorderRadius? borderRadius,
  Border? border,
  List<BoxShadow>? boxshadow,
  Gradient? gradient,
  BoxShape? shape,
  DecorationImage? image,
  BlendMode? blendMode,
}) {
  return BoxDecoration(
    color: color,
    border: border,
    image: image,
    gradient: gradient,
    boxShadow: boxshadow,
    borderRadius: borderRadius,
    backgroundBlendMode: blendMode,
    shape: shape ?? BoxShape.rectangle,
  );
}

Divider customDivider({
  Color? color,
  double? thinkNess,
  double? height,
  double? indent,
  double? endIndent,
}) {
  return Divider(
    color: color ?? ColorUtils.grey200,
    height: height ?? 2,
    thickness: thinkNess,
    indent: indent,
    endIndent: endIndent,
  );
}
