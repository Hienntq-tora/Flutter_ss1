import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/configs/icon_manager.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({
    super.key,
    this.onPressed,
    required this.isDisabled,
    required this.isUsed,
  });

  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool isUsed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabled = (isDisabled || isUsed);

    return SizedBox(
      width: 50,
      height: 32,
      child: Opacity(
        opacity: isDisabled ? 0.6 : 1,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          splashRadius: 25,
          style: IconButton.styleFrom(),
          onPressed: onPressed,
          splashColor: disabled ? Colors.transparent : null,
          highlightColor: disabled ? Colors.transparent : null,
          icon: SvgPicture.asset(
            IconManager.report,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isUsed ? theme.disabledColor : theme.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
