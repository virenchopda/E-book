import 'package:flutter/material.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/commanWidget/custom_btn.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../utils/app_text.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/size_config_utils.dart';
import '../../../utils/variable_utils.dart';

class ChooseGender extends StatelessWidget {
  final OnboardingController onboardingController;
  const ChooseGender({Key? key, required this.onboardingController})
      : super(key: key);

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
                  'What is your gender?',
                  fontSize: 25,
                  fontWeight: FontWeightClass.fontWeightBold,
                ),
                SizeConfig.sH1AndHalf,
                const AppText(
                  'Select gender for  better content.',
                  fontSize: 15,
                ),
                ListView.builder(
                  itemCount: onboardingController.genderList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () =>
                            onboardingController.changeGenderIndex(index),
                        minLeadingWidth: 0,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        leading: Radio(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorUtils.primary,
                          ),
                          value: index,
                          groupValue: onboardingController.selectedGenderIndex,
                          onChanged: onboardingController.changeGenderIndex,
                        ),
                        title: Text(onboardingController.genderList[index]),
                      ),
                    );
                  },
                ),
                SizeConfig.sH4,
                CustomBtn(
                  onTap: onboardingController.selectedGenderIndex >= 0
                      ? () => onboardingController.changeStep(5)
                      : null,
                  title: VariableUtils.continueVar,
                  bgColor: onboardingController.selectedGenderIndex >= 0
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
