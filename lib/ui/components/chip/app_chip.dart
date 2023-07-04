import 'package:flutter/material.dart';

import '../../../configs/font_manager.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child:
            Text(text, style: getChipTextStyle().copyWith(color: Colors.white)),
      ),
    );
  }
}
