import 'package:time_tracker/data/resources/enums/lesson_schedule_status.dart';
import 'package:time_tracker/data/resources/mappers/lesson_mapper.dart';
import 'package:time_tracker/data/resources/mappers/reservable_date_mapper.dart';
import 'package:time_tracker/data/resources/models/lesson_history_response.dart';
import 'package:time_tracker/domain/entities/lesson_history_output.dart';

extension LessonHistoryResponseX on LessonHistoryResponse {
  LessonHistoryOutput toEntity() {
    return LessonHistoryOutput(
      bookingId,
      statusLessonSchedule?.toEntity(),
      isCommented,
      isReported,
      idComment,
      link,
      lesson?.toEntity(),
      reservableDate?.toEntity(),
    );
  }
}

extension LessonScheduleStatusDtoX on LessonScheduleStatusDto {
  LessonScheduleStatus toEntity() {
    switch (this) {
      case LessonScheduleStatusDto.studying:
        return LessonScheduleStatus.studying;
      case LessonScheduleStatusDto.completed:
        return LessonScheduleStatus.completed;
      case LessonScheduleStatusDto.locked:
        return LessonScheduleStatus.locked;
    }
  }
}
