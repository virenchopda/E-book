// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_book/utils/font_style_utils.dart';
import 'package:e_book/utils/images_utils.dart';
import 'package:e_book/utils/size_config_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../controller/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorUtils.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommomImage(
            isAssetImage: true,
            image: LogoWidgets.logo,
            scale: 3.8,
          ),
          SizeConfig.sH5,
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 25,
              color: ColorUtils.black,
              fontWeight: FontWeightClass.fontWeight800,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Smart Book',
                  speed: const Duration(milliseconds: 100),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
