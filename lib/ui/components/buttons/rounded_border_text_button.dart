import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class RoundedBorderTextButton extends StatelessWidget {
  const RoundedBorderTextButton(
    this.text, {
    super.key,
    this.onTap,
    this.fillColor,
    this.textColor,
    this.borderColor,
    this.textStyle,
    this.borderRadius = 16.0,
    this.padding,
    this.splashColor,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsets? padding;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        side: BorderSide(
          color: borderColor ?? theme.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: fillColor ?? Colors.transparent,
        foregroundColor: splashColor,
        disabledBackgroundColor: fillColor ?? Colors.transparent,
        disabledForegroundColor:
            textColor ?? theme.textTheme.titleMedium?.color,
      ),
      child: Text(
        text,
        style: (textStyle ?? getBody2TextStyle())
            .copyWith(color: textColor ?? theme.textTheme.titleMedium?.color),
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
