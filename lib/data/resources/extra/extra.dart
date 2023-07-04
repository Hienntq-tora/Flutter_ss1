// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';

class CommentPageExtra {
  String bookingId;

  CommentPageExtra({required this.bookingId});
}

class TutorDetailExtra {
  String userId;
  bool isFromLessonHistoryPage;
  TutorDetailExtra({
    required this.userId,
    required this.isFromLessonHistoryPage,
  });
}

class ReportPageExtra {
  String? lessonId;

  ReportPageExtra({required this.lessonId});
}

enum TutorUpdateLessonType {
  createLesson,
  editLesson;
}

extension TutorUpdateLessonTypeX on TutorUpdateLessonType {
  String get title {
    switch (this) {
      case TutorUpdateLessonType.createLesson:
        return LocaleKeys.tutorUpdateLessonTitle1.tr();
      case TutorUpdateLessonType.editLesson:
        return LocaleKeys.tutorUpdateLessonTitle2.tr();
    }
  }

  bool get isCreateLesson => this == TutorUpdateLessonType.createLesson;
}
