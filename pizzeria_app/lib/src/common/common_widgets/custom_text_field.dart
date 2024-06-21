import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

class CustomTextField extends TextFormField {
  @override
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool withBorder;

  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    required this.withBorder,
    super.minLines,
    super.maxLines,
    this.autofocus = false,
    // int? maxLength = 127,
    bool super.enabled = true,
    String? labelText,
    TextStyle? labelStyle,
    EdgeInsets? labelPadding,
    String? subLabelText,
    TextStyle? subLabelStyle,
    super.onTap,
    super.focusNode,
    super.keyboardType,
    super.onEditingComplete,
    ValueChanged<String?>? super.onChanged,
    super.onSaved,
    ValueChanged<String>? onSubmitted,
    FormFieldValidator<String>? validator,
    AutovalidateMode? autovalidateMode,
    super.inputFormatters,
    Color? color,
    double? fontSize,
    super.restorationId,
    this.prefixIcon,
    this.suffixIcon,
    super.obscureText = false,
    bool autovalidate = true,
    // StrutStyle? strutStyle,
  }) : super(
          autofocus: autofocus,
          controller: controller,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Insets.lg, vertical: Insets.lg),
              focusedBorder: OutlineInputBorder(
                  borderSide: withBorder
                      ? const BorderSide(width: .5, color: Colors.grey)
                      : BorderSide.none,
                  // borderSide: BorderSide(width: .5, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              enabledBorder: OutlineInputBorder(
                //
                borderSide: withBorder
                    ? const BorderSide(width: .5, color: Colors.grey)
                    : BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),

              // focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide.none,
                  borderSide: withBorder
                      ? const BorderSide(width: .5, color: Colors.grey)
                      : BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              prefixIcon: prefixIcon,
              filled: true,
              prefixIconColor: Colors.grey.withOpacity(.7),
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.grey.withOpacity(.7),
              fillColor: CupertinoColors.lightBackgroundGray),

          // strutStyle: const StrutStyle(forceStrutHeight: true),
        );
}
