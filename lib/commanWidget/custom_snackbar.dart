import 'package:get/get.dart';
import 'package:flutter/material.dart';

SnackbarController showSnackBar({Color? snackColor, required String message}) {
  return Get.showSnackbar(
    GetSnackBar(
      message: message.tr,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: snackColor ?? Colors.red,
    ),
  );
}
