import 'package:e_book/model/apiModel/firebaseModel/sign_up_model.dart';
import 'package:e_book/utils/app_text.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/utils/icon_utils.dart';
import 'package:e_book/utils/size_config_utils.dart';
import 'package:e_book/view/onboarding/components/sign_up_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../app_services/auth_services.dart';
import '../../../commanWidget/custom_btn.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../utils/const_utils.dart';
import '../../../utils/font_style_utils.dart';
import '../../../utils/validation_utils.dart';
import '../../../utils/variable_utils.dart';

final signUpKey = GlobalKey<FormState>();
final username = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
final confirmPassword = TextEditingController();

class SignUp extends StatelessWidget {
  SignUp({Key? key, required this.onboardingController}) : super(key: key);

  final OnboardingController onboardingController;

  final auth = Get.find<AuthSetvices>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthSetvices>(
      init: AuthSetvices(),
      builder: (authSetvices) {
        return Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: signUpKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      VariableUtils.createAnAccount,
                      fontSize: 25,
                      fontWeight: FontWeightClass.fontWeightBold,
                    ),
                    SizeConfig.sH1AndHalf,
                    const AppText(
                      VariableUtils.enterYourName,
                      fontSize: 15,
                    ),
                    SizeConfig.sH1AndHalf,
                    SignUpTextField(
                      allowInputFormatters:
                          RegularExpression.alphabetDigitsPattern,
                      controller: username,
                      hintText: VariableUtils.username.tr,
                      validate: (v) => userValidation(v),
                    ),
                    SignUpTextField(
                      allowInputFormatters:
                          RegularExpression.emailKeyboardPattern,
                      controller: email,
                      hintText: VariableUtils.email.tr,
                      validate: (v) => emailValidation(v),
                      textInputType: TextInputType.emailAddress,
                    ),
                    SignUpTextField(
                      controller: password,
                      hintText: VariableUtils.password.tr,
                      allowInputFormatters: RegularExpression.passwordPattern,
                      obscuredText: onboardingController.passwordVisible,
                      suffixIcon: IconButton(
                        splashRadius: 6.w,
                        onPressed: onboardingController.changePasswordVisible,
                        icon: Icon(
                          IconData(
                            onboardingController.passwordVisible
                                ? IconDataClass.visibility.codePoint
                                : IconDataClass.visibilityOff.codePoint,
                            fontFamily: 'MaterialIcons',
                          ),
                          color: ColorUtils.primary,
                          // size: size,
                        ),
                      ),
                      validate: (v) => passwordValidation(v),
                    ),
                    SignUpTextField(
                      allowInputFormatters: RegularExpression.passwordPattern,
                      controller: confirmPassword,
                      hintText: VariableUtils.confirmPassword.tr,
                      obscuredText: onboardingController.confirmPasswordVisible,
                      suffixIcon: IconButton(
                        splashRadius: 6.w,
                        onPressed:
                            onboardingController.changeConfirmPasswordVisible,
                        icon: Icon(
                          onboardingController.confirmPasswordVisible
                              ? IconDataClass.visibility
                              : IconDataClass.visibilityOff,
                          color: ColorUtils.primary,
                        ),
                      ),
                      validate: (v) =>
                          confirmPasswordValidation(v, password.text),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: onboardingController.rememberMe,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          checkColor: ColorUtils.white,
                          activeColor: ColorUtils.primary,
                          onChanged: onboardingController.changeRemberMe,
                        ),
                        const AppText(
                          VariableUtils.rememberMe,
                          fontWeight: FontWeightClass.fontWeight600,
                        )
                      ],
                    ),
                    SizeConfig.sH2,
                    CustomBtn(
                      title: VariableUtils.signUp,
                      onTap: () async {
                        // if (signUpKey.currentState!.validate()) {
                        //   if (onboardingController.rememberMe == false) {}

                        //   SignUpModel signUpModel = SignUpModel();
                        //   signUpModel.email = email.text;
                        //   signUpModel.password = password.text;
                        //   signUpModel.username = username.text;
                        //   print("22222222222222222");
                        //   onboardingController.changeStep(2);
                        //   // authSetvices.signUp(signUpModel: signUpModel);
                        // }
                        logs("22222222222222222");
                        onboardingController.changeStep(3);
                        logs("22222222222222222 ---");
                      },
                    ),
                    SizeConfig.sH1AndHalf,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
