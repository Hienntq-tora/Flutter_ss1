import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.elevation = 0,
    this.dimension = 48,
    this.color,
    this.splashColor,
    this.shadowColor,
    this.shape,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final double elevation;
  final double dimension;
  final Color? shadowColor;
  final Widget icon;
  final Color? color;
  final Color? splashColor;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox.square(
      dimension: dimension,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shadowColor: shadowColor ?? Colors.transparent,
          backgroundColor: color ?? theme.primaryColor,
          foregroundColor: splashColor,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
