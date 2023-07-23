import 'package:flutter/material.dart';

import '../utils/app_text.dart';
import '../utils/typedef_utils.dart';

class CustomListTile extends StatelessWidget {
  final Widget? trailing;
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Color? tileColor;

  final Color? titleColor;
  final double? titleFontSize;
  final int? titleMaxLine;
  final TextOverflow? titleOverFlow;

  final int? subtitleMaxLine;
  final Color? subtitleColor;
  final double? subtitleFontSize;
  final TextOverflow? subtitleOverFlow;

  final OnTab? onTap;
  final bool? dense;
  final EdgeInsets? contentPadding;

  const CustomListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileColor,
    this.onTap,
    this.dense,
    this.contentPadding,
    this.titleFontSize,
    this.titleColor,
    this.titleMaxLine,
    this.titleOverFlow,
    this.subtitleFontSize,
    this.subtitleColor,
    this.subtitleMaxLine,
    this.subtitleOverFlow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: AppText(
        title ?? '',
        fontSize: titleFontSize,
        color: titleColor,
        maxLines: titleMaxLine,
        overflow: titleOverFlow,
      ),
      subtitle: AppText(
        subtitle ?? '',
        fontSize: subtitleFontSize,
        color: subtitleColor,
        maxLines: subtitleMaxLine,
        overflow: subtitleOverFlow,
      ),
      trailing: trailing,
      tileColor: tileColor,
      onTap: onTap,
      dense: dense ?? false,
      contentPadding: contentPadding,
    );
  }
}
