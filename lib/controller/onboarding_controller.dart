import 'package:e_book/routes/route_helper.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/utils/shared_preference_utils.dart';
import 'package:e_book/view/home/home.dart';
import 'package:e_book/view/onboarding/onboarding_1.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/const_utils.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool rememberMe = false;

  void changePasswordVisible() {
    passwordVisible = !passwordVisible;
    update();
  }

  void changeConfirmPasswordVisible() {
    confirmPasswordVisible = false;
    update();
  }

  void changeRemberMe(bool? v) {
    rememberMe = !rememberMe;
    update();
  }

  void changeStep(int stepArgs) async {
    logs(stepArgs);
    if (stepArgs == 0) {
      Get.offAll(() => const Onboarding1());
    } else {
      await PreferenceString.setStep(value: stepArgs);
      update();
      if (stepArgs == 5) {
        Get.offAllNamed(RouteHelper.getHomeRoute());
        logs("goto Goto home");
      }
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<String> selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: ColorUtils.primary),
            dialogBackgroundColor: ColorUtils.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return selectedDate.toString().split(" ")[0];
    } else {
      return '';
    }
  }

  List ageList = [
    "14-17",
    "18-24",
    "25-29",
    "30-34",
    "35-39",
    "40-44",
    "45-49",
    "50-60"
  ];
  int selectedAgeIndex = -1;
  changeAgeIndex(int index) {
    selectedAgeIndex = index;
    update();
  }

  List genderList = ["I am male", "I am female", "Rather not to say"];
  int selectedGenderIndex = -1;
  changeGenderIndex(index) {
    selectedGenderIndex = index;
    update();
  }

  final imagePicker = ImagePicker();
  String imgPath = "";
  Future<void> pickImage() async {
    try {
      final tempPath = await imagePicker.pickImage(source: ImageSource.gallery);
      imgPath = tempPath!.path;
      update();
      logs(name: "FILE PICKER", imgPath);
    } catch (e) {
      logs(name: "FILE PICKER EXCEPTION", e);
    }
  }
}
