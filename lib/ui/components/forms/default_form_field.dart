import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker/configs/font_manager.dart';

class DefaultFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? errorMaxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final EdgeInsets padding;
  final double spacing;
  final bool autofocus;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const DefaultFormField({
    Key? key,
    required this.onChanged,
    required this.validator,
    this.initialValue,
    this.nextFocusNode,
    this.focusNode,
    this.controller,
    this.hintText,
    this.maxLength,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.errorMaxLines,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.spacing = 20.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    this.autofocus = true,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: onTap,
      autofocus: autofocus,
      readOnly: readOnly,
      controller: controller,
      style: getBody2TextStyle(),
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        errorMaxLines: errorMaxLines ?? 2,
        counterText: counterText,
        isDense: true,
        contentPadding: EdgeInsets.only(
          top: padding.top,
          bottom: padding.bottom,
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIconConstraints: (prefixIcon != null)
            ? null
            : BoxConstraints(maxWidth: padding.left),
        suffixIconConstraints: (suffixIcon != null)
            ? null
            : BoxConstraints(maxWidth: padding.right),
        prefixIcon: (prefixIcon != null)
            ? Padding(
                padding: EdgeInsets.only(right: spacing, left: padding.left),
                child: prefixIcon,
              )
            : SizedBox(
                width: padding.left,
                height: 48,
              ),
        suffixIcon: (suffixIcon != null)
            ? Padding(
                padding: EdgeInsets.only(left: spacing, right: padding.right),
                child: suffixIcon,
              )
            : SizedBox(
                width: padding.right,
                height: 48,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFEFF1F3), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
        ),
      ),
    );
  }
}
