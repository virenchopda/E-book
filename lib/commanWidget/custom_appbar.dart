import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils/app_text.dart';
import '../utils/icon_utils.dart';
import '../utils/typedef_utils.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final OnTab? onPress;
  final bool? centerTile;
  final Color? textColor;
  final Color? iconColor;
  final List<Widget>? action;
  final double? titleSpaceing;
  final Color? backgroundColor;

  const CustomAppbar({
    Key? key,
    this.title,
    this.action,
    this.onPress,
    this.textColor,
    this.iconColor,
    this.backgroundColor,
    this.titleSpaceing,
    this.centerTile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTile,
      titleSpacing: titleSpaceing,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: IconUtilsWidgets(
        icon: IconDataClass.arrowBack,
        color: iconColor,
        onPress: onPress ?? () => Get.back(),
      ),
      title: AppText(title ?? '', color: textColor),
      actions: action ?? [],
    );
  }
}
