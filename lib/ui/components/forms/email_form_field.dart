import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';

class EmailFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction textInputAction;

  const EmailFormField({
    Key? key,
    required this.onChanged,
    required this.validator,
    this.initialValue,
    this.nextFocusNode,
    this.focusNode,
    this.controller,
    this.hintText,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autofocus: false,
      controller: controller,
      style: getBody2TextStyle(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 16, bottom: 16, right: 30),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 20, left: 30.0),
          child: SvgPicture.asset(
            IconManager.mail,
            colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
                BlendMode.srcIn),
          ),
        ),
        hintText: hintText ?? LocaleKeys.fieldEmailHint.tr(),
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
