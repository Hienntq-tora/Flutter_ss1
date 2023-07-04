import 'package:flutter/material.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/lesson_history_tile/lesson_history_bottom_tile.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/lesson_history_tile/lesson_history_top_tile.dart';

class LessonHistoryTileModel {
  final String lessonImageUrl;
  final String lessonTitle;
  final String lessonDifficulty;
  final String lessonStatus;
  final String tutorFullName;
  final String? countryCode;
  final bool isCommented;
  final bool isReported;
  final bool isLocked;

  LessonHistoryTileModel({
    required this.lessonImageUrl,
    required this.lessonTitle,
    required this.lessonDifficulty,
    required this.lessonStatus,
    required this.tutorFullName,
    required this.countryCode,
    required this.isCommented,
    required this.isReported,
    required this.isLocked,
  });
}

class LessonHistoryTile extends StatelessWidget {
  const LessonHistoryTile({
    super.key,
    required this.model,
    this.onTap,
    this.onCommentButtonPressed,
    this.onReportButtonPressed,
  });

  final LessonHistoryTileModel model;
  final VoidCallback? onTap;
  final VoidCallback? onCommentButtonPressed;
  final VoidCallback? onReportButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.isLocked ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: GeneralColors.grey30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: HistoryTopTile(model: model),
              ),
              Container(height: 1, color: GeneralColors.grey30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: HistoryBottomTile(
                  model: model,
                  onCommentButtonPressed: onCommentButtonPressed,
                  onReportButtonPressed: onReportButtonPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
