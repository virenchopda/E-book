import 'dart:io';

import 'package:e_book/commanWidget/custom_snackbar.dart';
import 'package:e_book/utils/app_text.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/utils/const_utils.dart';
import 'package:e_book/utils/icon_utils.dart';
import 'package:e_book/utils/size_config_utils.dart';
import 'package:e_book/view/onboarding/components/sign_up_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../commanWidget/custom_btn.dart';
import '../../../../controller/onboarding_controller.dart';
import '../../../../utils/font_style_utils.dart';
import '../../../../utils/validation_utils.dart';
import '../../../../utils/variable_utils.dart';

final profileKey = GlobalKey<FormState>();
final fullname = TextEditingController();
final dateOfBirth = TextEditingController();
final phoneNumber = TextEditingController();
final country = TextEditingController();

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({
    Key? key,
    required this.onboardingController,
  }) : super(key: key);

  final OnboardingController onboardingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: profileKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizeConfig.sH2,
                const AppText(
                  VariableUtils.completeYourProfile,
                  fontSize: 25,
                  fontWeight: FontWeightClass.fontWeightBold,
                ),
                SizeConfig.sH1AndHalf,
                const AppText(
                  VariableUtils.profileDescription,
                  fontSize: 15,
                ),
                SizeConfig.sH5,
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(130),
                        child: Container(
                          width: 130,
                          height: 130,
                          color: ColorUtils.greyE0,
                          child: onboardingController.imgPath != ""
                              ? Image.file(File(onboardingController.imgPath))
                              : const SizedBox(),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 10,
                        child: InkWell(
                          onTap: () {
                            onboardingController.pickImage();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 20,
                              height: 20,
                              color: ColorUtils.primary,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/9356/9356210.png',
                                  color: ColorUtils.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizeConfig.sH5,
                SignUpTextField(
                  allowInputFormatters:
                      RegularExpression.fullNameKeyboardPattern,
                  controller: fullname,
                  hintText: VariableUtils.fullName.tr,
                  validate: (v) => userValidation(v),
                ),
                SignUpTextField(
                  allowInputFormatters:
                      RegularExpression.contactKeyboardPattern,
                  controller: phoneNumber,
                  maxLength: 10,
                  hintText: VariableUtils.phoneNumber.tr,
                  textInputType: TextInputType.phone,
                  validate: (v) => mobileValidation(v),
                ),
                SignUpTextField(
                  readonly: true,
                  showCursor: false,
                  controller: dateOfBirth,
                  hintText: VariableUtils.dateOfBirth.tr,
                  validate: (v) => emptyValidation(v),
                  suffixIcon: IconButton(
                    splashRadius: 6.w,
                    onPressed: () async {
                      String data =
                          await onboardingController.selectDate(context);
                      if (data != '') {
                        dateOfBirth.text = data;
                      }
                    },
                    icon: Icon(
                      IconData(
                        IconDataClass.calenderMonth.codePoint,
                        fontFamily: 'MaterialIcons',
                      ),
                      color: ColorUtils.primary,
                    ),
                  ),
                ),
                SizeConfig.sH1,
                DropdownButtonFormField(
                  hint: const AppText(
                    VariableUtils.country,
                    color: ColorUtils.black,
                    fontWeight: FontWeightClass.fontWeightBold,
                  ),
                  items: ["India", "Usa", "Canada"].map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: AppText(
                        items,
                        color: ColorUtils.black,
                        fontWeight: FontWeightClass.fontWeightBold,
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: ColorUtils.primary),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: ColorUtils.primary),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: ColorUtils.primary),
                    ),
                  ),
                  validator: emptyValidation,
                  onChanged: (v) {},
                ),
                SizeConfig.sH5,
                CustomBtn(
                  title: VariableUtils.continueVar,
                  onTap: () {
                    if (profileKey.currentState!.validate()) {
                      if (onboardingController.imgPath != "") {
                        onboardingController.changeStep(3);
                      } else {
                        showSnackBar(message: "Image not selected");
                      }
                    }
                  },
                ),
                SizeConfig.sH3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
