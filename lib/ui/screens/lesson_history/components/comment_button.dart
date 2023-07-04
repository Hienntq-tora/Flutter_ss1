import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/configs/icon_manager.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({
    super.key,
    // required this.type,
    required this.isDisabled,
    required this.isHighlighted,
    this.onPressed,
  });

  // final CommentButtonType type;
  final bool isDisabled;
  final bool isHighlighted;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Opacity(
      opacity: isDisabled ? 0.6 : 1,
      child: SizedBox(
        width: 50,
        height: 32,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
            backgroundColor:
                isHighlighted ? theme.primaryColor : Colors.transparent,
            foregroundColor: isHighlighted ? null : theme.dividerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: isHighlighted ? Colors.transparent : theme.primaryColor,
            ),
            disabledBackgroundColor:
                isHighlighted ? theme.primaryColor : Colors.transparent,
          ),
          child: SvgPicture.asset(
            isHighlighted ? IconManager.commentFilled : IconManager.comment,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
