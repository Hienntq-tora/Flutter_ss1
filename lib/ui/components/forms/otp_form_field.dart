import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/theme_manager.dart';

class OtpFormField extends StatelessWidget {
  const OtpFormField({
    super.key,
    this.controller,
    this.onCompleted,
    this.focusNode,
  });

  final TextEditingController? controller;
  final Function(String otp)? onCompleted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultPinTheme = PinTheme(
        width: 48,
        height: 60,
        textStyle: const TextStyle(
          fontFamily: FontManager.sFProText,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: GeneralColors.neutral2),
          borderRadius: BorderRadius.circular(16),
        ));

    final focusedPinTheme = defaultPinTheme.copyBorderWith(
      border: Border.all(color: theme.colorScheme.primary),
    );

    return Pinput(
      autofocus: true,
      controller: controller,
      focusNode: focusNode,
      onCompleted: onCompleted,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      separator: const SizedBox(width: 28.0),
      focusedPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    );
  }
}
