import 'package:time_tracker/data/resources/enums/lesson_schedule_status.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';

class LessonHistoryOutput {
  LessonHistoryOutput(
    this.bookingId,
    this.statusLessonSchedule,
    this.isCommented,
    this.isReported,
    this.idComment,
    this.link,
    this.lesson,
    this.reservableDate,
  );

  final String? bookingId;
  final LessonScheduleStatus? statusLessonSchedule;
  final bool? isCommented;
  final bool? isReported;
  final String? idComment;
  final String? link;
  final Lesson? lesson;
  final ReservableDate? reservableDate;
}
