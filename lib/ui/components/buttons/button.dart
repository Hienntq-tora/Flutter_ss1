import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPressed,
    required this.text,
    this.height = 48,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
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
        ),
        child: Text(
          text,
          style: getHeadline2TextStyle(),
        ),
      ),
    );
  }
}
