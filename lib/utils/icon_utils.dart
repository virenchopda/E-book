import 'color_utils.dart';
import 'typedef_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class IconDataClass {
  static IconData arrowBack = Icons.arrow_back;
  static IconData visibility = Icons.visibility;
  static IconData visibilityOff = Icons.visibility_off;
  static IconData calenderMonth = Icons.calendar_month;
}

class IconUtilsWidgets extends StatelessWidget {
  final IconData icon;
  final OnTab? onPress;
  final bool? isIcon;
  final Color? color;
  final double? size;
  // final double? width;
  // final double? fill;
  // final double? grade;

  const IconUtilsWidgets({
    Key? key,
    required this.icon,
    this.isIcon = false,
    this.onPress,
    this.color,
    this.size,
    // this.width,
    // this.fill,
    // this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIcon == true) {
      return InkWell(
        borderRadius: BorderRadius.circular(5.w),
        splashColor: ColorUtils.transparentColor,
        highlightColor: ColorUtils.transparentColor,
        onTap: onPress ?? () {},
        child: Icon(
          IconData(icon.codePoint, fontFamily: 'MaterialIcons'),
          size: size,
          color: color,
          // fill: fill,
          // weight: width,
          // grade: grade,
        ),
      );
    }
    return IconButton(
      splashRadius: 6.w,
      splashColor: ColorUtils.transparentColor,
      highlightColor: ColorUtils.transparentColor,
      onPressed: onPress ?? () {},
      icon: Icon(
        IconData(icon.codePoint, fontFamily: 'MaterialIcons'),
        color: color,
        size: size,
        // weight: width,
        // fill: fill,
        // grade: grade,
      ),
    );
  }
}
