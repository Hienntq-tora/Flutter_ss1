import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';

import '../../../configs/icon_manager.dart';

class PasswordFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction textInputAction;

  const PasswordFormField({
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
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autofocus: false,
      controller: widget.controller,
      style: getBody2TextStyle(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SvgPicture.asset(
            IconManager.password,
            colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
                BlendMode.srcIn),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: SvgPicture.asset(
                _obscureText ? IconManager.eyes : IconManager.openEyes,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.white,
                    BlendMode.srcIn)),
            onPressed: _toggle,
          ),
        ),
        hintText: widget.hintText ?? LocaleKeys.fieldPasswordHint.tr(),
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
