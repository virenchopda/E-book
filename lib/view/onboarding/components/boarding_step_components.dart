import 'package:e_book/controller/onboarding_controller.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/utils/const_utils.dart';
import 'package:e_book/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/icon_utils.dart';
import '../../../utils/size_config_utils.dart';

class BoardingStep extends StatelessWidget {
  // final int step;

  final OnboardingController onboardingController;

  final int step;

  const BoardingStep({
    Key? key,
    required this.step,
    required this.onboardingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconUtilsWidgets(
              icon: IconDataClass.arrowBack,
              onPress: () async {
                int step = await PreferenceString.getStep();
                onboardingController.changeStep(step - 1);
              }),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 220,
              color: ColorUtils.greyE0,
              child: Row(
                children: [
                  Container(
                    width: (220 / 4) * step,
                    height: 15,
                    color: ColorUtils.primary,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizeConfig.sW10,
        ],
      ),
    );
  }
}
