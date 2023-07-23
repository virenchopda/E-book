import 'package:flutter/material.dart';
import '../../../utils/app_text.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/icon_utils.dart';
import '../../../utils/size_config_utils.dart';

signUpDIalog({required BuildContext context}) {
  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, dialogSetState) {
          return WillPopScope(
            onWillPop: () async => true,
            child: AlertDialog(
                content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizeConfig.sH2,
                Container(
                  height: 80,
                  width: 80,
                  decoration: containerDecoration(
                    shape: BoxShape.circle,
                    color: ColorUtils.primary,
                  ),
                  child: const IconUtilsWidgets(
                    icon: Icons.person,
                    color: ColorUtils.white,
                    size: 35,
                  ),
                ),
                SizeConfig.sH2,
                const AppText(
                  'Sign Up Successfully',
                  fontSize: 20,
                  color: ColorUtils.primary,
                  fontWeight: FontWeightClass.fontWeight600,
                ),
                SizeConfig.sH2,
                const AppText(
                  'Your account has been created please wait a moment. we are preparing for you.',
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
                SizeConfig.sH2,
              ],
            )),
          );
        },
      );
    },
  );
}
