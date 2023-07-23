import 'package:e_book/utils/const_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/validation_utils.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final int? maxLines;
  final bool? readOnly;
  final bool? enabled;
  final Color? cursorColor;
  final TextAlign? textAlign;

  final double? cursorHeight;
  final int? maxLength;
  final TextStyle? style;

  final bool? showCursor;
  final bool? obscuredText;

  final double? cursorRadius;
  final FocusNode? focusNode;

  final String? obscuringCharacter;
  final TextInputType? textInputType;

  final dynamic border;
  final dynamic focusBorder;
  final dynamic enabledBorder;

  final EdgeInsetsGeometry? padding;
  final bool? filled;
  final Color? filledColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final TextStyle? labelStyle;
  final bool? isDense;

  final Iterable<String>? autoFillHints;
  final String? allowInputFormatters;
  final String? denyInputFormatters;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    this.maxLines,
    this.readOnly,
    this.enabled,
    this.cursorColor,
    this.cursorHeight,
    this.textAlign,
    this.maxLength,
    this.style,
    this.showCursor,
    this.focusNode,
    this.obscuredText,
    this.textInputType,
    this.obscuringCharacter,
    this.cursorRadius,
    this.border,
    this.enabledBorder,
    this.focusBorder,
    this.padding,
    this.filled,
    this.filledColor,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
    this.labelStyle,
    this.autoFillHints,
    this.allowInputFormatters,
    this.denyInputFormatters,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      cursorColor: cursorColor,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      // cursorHeight: cursorHeight!,
      autofillHints: autoFillHints ?? [],
      validator: (v) => validator(v),
      textInputAction: textInputAction ?? TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(
            allowInputFormatters ?? RegularExpression.allKeyboardPattern,
          ),
        ),
        FilteringTextInputFormatter.deny(
          RegExp(
            denyInputFormatters ??
                RegularExpression.onlyFirstSpaceNoAllowPattern,
          ),
        ),
      ],
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength ?? 1000,
      style: style ?? const TextStyle(),
      focusNode: focusNode,
      showCursor: showCursor ?? true,
      obscureText: obscuredText ?? false,
      obscuringCharacter: obscuringCharacter ?? '*',
      keyboardType: textInputType ?? TextInputType.name,
      cursorRadius: Radius.circular(cursorRadius ?? 0.0),
      onChanged: (v) {},
      decoration: InputDecoration(
        disabledBorder: border,
        border: border,
        enabledBorder: border, // enabledBorder,
        focusedBorder: border, // focusBorder,
        contentPadding: padding,
        counterText: '',
        labelText: hintText ?? '',
        labelStyle: labelStyle ?? const TextStyle(),
        filled: filled ?? false,
        fillColor: filledColor,

        // hintText: hintText,
        // hintStyle: hintStyle ?? const TextStyle(),
        isDense: isDense ?? false,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
