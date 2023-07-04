import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/configs/icon_manager.dart';

class TextAreaFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final TextInputType? keyboardType;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool autofocus;
  final String? hintText;
  final String? leadingIcon;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool enable;

  const TextAreaFormField({
    Key? key,
    required this.onChanged,
    required this.validator,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.nextFocusNode,
    this.focusNode,
    this.controller,
    this.autofocus = false,
    this.hintText,
    this.leadingIcon,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      autofocus: autofocus,
      enabled: enable,
      controller: controller,
      maxLength: maxLength,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: !enable ? Theme.of(context).disabledColor : null),
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        errorMaxLines: 2,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        prefixIcon: leadingIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: SvgPicture.asset(
                  IconManager.mail,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).textTheme.bodyMedium?.color ??
                          Colors.white,
                      BlendMode.srcIn),
                ),
              )
            : const SizedBox(),
        suffixIcon: const SizedBox(),
        prefixIconConstraints: leadingIcon != null
            ? null
            : const BoxConstraints(maxWidth: 16, minWidth: 16),
        suffixIconConstraints: const BoxConstraints(maxWidth: 16, minWidth: 16),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFEFF1F3), width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFEFF1F3), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1),
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
