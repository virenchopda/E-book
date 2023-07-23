import 'package:e_book/utils/shared_preference_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_book/view/onboarding/components/boarding_step_components.dart';

import '../../controller/onboarding_controller.dart';
import 'components/choose_age.dart';
import 'components/choose_gender.dart';
import 'components/complete_profile_components.dart';
import 'components/sign_up_component.dart';

class Onboarding2 extends StatelessWidget {
  Onboarding2({Key? key}) : super(key: key);

  OnboardingController onboardingController = Get.put(OnboardingController());
  // final OnboardingController onboardingController =
  //     Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (onboardingController) {
        return WillPopScope(
          onWillPop: () async {
            onboardingController.changeStep(-1);
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  BoardingStep(
                    onboardingController: onboardingController,
                    step: prefeBoardingStep,
                  ),
                  if (prefeBoardingStep == 1) ...[
                    SignUp(onboardingController: onboardingController)
                  ],
                  if (prefeBoardingStep == 2) ...[
                    CompleteProfile(onboardingController: onboardingController)
                  ],
                  if (prefeBoardingStep == 3) ...[
                    ChooseAge(onboardingController: onboardingController)
                  ],
                  if (prefeBoardingStep == 4) ...[
                    ChooseGender(onboardingController: onboardingController)
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
