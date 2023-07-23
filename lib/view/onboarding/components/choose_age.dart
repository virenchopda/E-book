import 'package:e_book/commanWidget/custom_btn.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../utils/app_text.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/size_config_utils.dart';
import '../../../utils/variable_utils.dart';

class ChooseAge extends StatelessWidget {
  final OnboardingController onboardingController;

  const ChooseAge({
    Key? key,
    required this.onboardingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizeConfig.sH2,
                const AppText(
                  'Choose your age',
                  fontSize: 25,
                  fontWeight: FontWeightClass.fontWeightBold,
                ),
                SizeConfig.sH1AndHalf,
                const AppText(
                  'Select age range for better content',
                  fontSize: 15,
                ),
                SizeConfig.sH4,
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 35,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    // childAspectRatio: 2 / 3,
                  ),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          onboardingController.changeAgeIndex(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                                onboardingController.selectedAgeIndex == index
                                    ? ColorUtils.primary
                                    : ColorUtils.transparentColor,
                            border: Border.all(
                              color: ColorUtils.primary,
                            ),
                          ),
                          child: AppText(
                            onboardingController.ageList[index],
                            color:
                                onboardingController.selectedAgeIndex == index
                                    ? ColorUtils.white
                                    : ColorUtils.primary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizeConfig.sH4,
                CustomBtn(
                  onTap: onboardingController.selectedAgeIndex >= 0
                      ? () => onboardingController.changeStep(4)
                      : null,
                  title: VariableUtils.continueVar,
                  bgColor: onboardingController.selectedAgeIndex >= 0
                      ? ColorUtils.primary
                      : ColorUtils.greyE0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
