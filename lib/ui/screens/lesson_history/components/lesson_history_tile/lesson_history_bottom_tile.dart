import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/comment_button.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/lesson_history_tile/lesson_history_tile.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/report_button.dart';

class HistoryBottomTile extends StatelessWidget {
  const HistoryBottomTile({
    super.key,
    required this.model,
    this.onCommentButtonPressed,
    this.onReportButtonPressed,
  });

  final LessonHistoryTileModel model;
  final VoidCallback? onCommentButtonPressed;
  final VoidCallback? onReportButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  model.tutorFullName,
                  style: getHeadline2TextStyle(),
                ),
              ),
              const SizedBox(width: 8),
              if (model.countryCode != null && model.countryCode!.isNotEmpty)
                CountryFlag(
                  height: 24,
                  country: Country.fromCode(model.countryCode!),
                ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        Row(
          children: [
            CommentButton(
              isHighlighted: model.isCommented,
              isDisabled: model.isLocked,
              onPressed: onCommentButtonPressed,
            ),
            const SizedBox(width: 8),
            ReportButton(
              isUsed: model.isReported,
              isDisabled: model.isLocked,
              onPressed: onReportButtonPressed,
            ),
          ],
        ),
      ],
    );
  }
}
