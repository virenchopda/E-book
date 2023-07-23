import 'package:e_book/commanWidget/custom_textformfield.dart';
import 'package:e_book/utils/color_utils.dart';
import 'package:e_book/utils/const_utils.dart';
import 'package:e_book/utils/font_style_utils.dart';
import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final bool? readonly;

  const SignUpTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validate,
    this.allowInputFormatters,
    this.maxLength,
    this.suffixIcon,
    this.obscuredText,
    this.textInputType,
    this.showCursor,
    this.enabled,
    this.readonly,
  }) : super(key: key);

  final String hintText;
  final String? allowInputFormatters;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final bool? obscuredText;
  final Function validate;
  final bool? showCursor;
  final bool? enabled;
  final int? maxLength;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      allowInputFormatters: allowInputFormatters,
      controller: controller,
      maxLength: maxLength,
      readOnly: readonly,
      obscuredText: obscuredText,
      enabled: enabled,
      showCursor: showCursor,
      hintText: hintText,
      textInputType: textInputType,
      validator: (v) => validate(v),
      style: const TextStyle(
        fontSize: 14,
        color: ColorUtils.black,
        fontWeight: FontWeightClass.fontWeightBold,
      ),
      labelStyle: const TextStyle(
        color: ColorUtils.black,
        fontWeight: FontWeightClass.fontWeightBold,
      ),
      border: const UnderlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: ColorUtils.primary),
      ),
      cursorColor: ColorUtils.primary,
      suffixIcon: suffixIcon,
    );
  }
}
