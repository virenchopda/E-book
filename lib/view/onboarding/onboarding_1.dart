import 'package:e_book/utils/app_text.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/routes/route_helper.dart';
import 'package:e_book/utils/const_utils.dart';
import 'package:e_book/commanWidget/custom_btn.dart';
import 'package:e_book/utils/font_style_utils.dart';
import 'package:e_book/utils/images_utils.dart';
import 'package:flutter/material.dart';
import 'package:e_book/utils/navigation.dart';
import 'package:e_book/utils/size_config_utils.dart';
import 'package:e_book/utils/variable_utils.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            CommomImage(
              image: LogoWidgets.logo,
              scale: 2.5,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                    VariableUtils.welcomeToEbook,
                    fontSize: 19,
                    fontFamily: nutinoSansBold,
                    fontWeight: FontWeightClass.fontWeight800,
                  ),
                  SizeConfig.sH2,
                  const AppText(
                    VariableUtils.onboardingMessage,
                    textAlign: TextAlign.center,
                    fontSize: 14,
                  ),
                  SizeConfig.sH3,
                  CustomBtn(
                    title: VariableUtils.getStarted,
                    onTap: () =>
                        getNamed(named: RouteHelper.getOnBoarding2Route()),
                  ),
                  SizeConfig.sH3,
                  const CustomBtn(
                    title: VariableUtils.alreadyHaveAnAccount,
                    bgColor: ColorUtils.orange46,
                    textColor: ColorUtils.primary,
                  ),
                  SizeConfig.sH5,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
