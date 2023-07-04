import 'package:flutter/material.dart';
import 'package:time_tracker/configs/theme_manager.dart';

import '../../../configs/font_manager.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.fillColor,
      this.height = 48})
      : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Color? fillColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: fillColor ?? GeneralColors.neutral2,
        ),
        child: Text(
          text,
          style: getHeadline3TextStyle(),
        ),
      ),
    );
  }
}
