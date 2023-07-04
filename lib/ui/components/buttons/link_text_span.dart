import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class LinkTextSpan extends StatelessWidget {
  const LinkTextSpan({
    super.key,
    required this.link,
    this.prefixText,
    this.suffixText,
    this.onTap,
    this.textAlign = TextAlign.start,
  });

  final String link;
  final String? prefixText;
  final String? suffixText;
  final VoidCallback? onTap;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          if (prefixText != null)
            TextSpan(
                text: prefixText,
                style: getBody2TextStyle().copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black)),
          TextSpan(
            text: link,
            style:
                getOnlyButtonTextStyle().copyWith(color: colorScheme.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          if (prefixText != null)
            TextSpan(
                text: suffixText,
                style: getBody2TextStyle().copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black)),
        ],
      ),
    );
  }
}
