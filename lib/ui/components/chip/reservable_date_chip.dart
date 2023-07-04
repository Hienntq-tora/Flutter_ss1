import 'package:flutter/material.dart';

import '../../../configs/font_manager.dart';

class ReservableDateChip extends StatelessWidget {
  const ReservableDateChip({
    super.key,
    required this.text,
    this.borderColor,
    this.fillColor,
    this.textColor,
    this.onTap,
  });

  final String text;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
            color: fillColor),
        child: Center(
          child: Text(
            text,
            style: getBody2TextStyle().copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
