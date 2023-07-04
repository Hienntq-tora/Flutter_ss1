import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracker/data/resources/models/lesson_dto.dart';
import 'package:time_tracker/data/resources/models/reservable_date_dto.dart';

part 'lesson_history_response.g.dart';

@JsonSerializable()
class LessonHistoryResponse {
  const LessonHistoryResponse(
    this.bookingId,
    this.statusLessonSchedule,
    this.isCommented,
    this.isReported,
    this.idComment,
    this.link,
    this.lesson,
    this.reservableDate,
  );

  factory LessonHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonHistoryResponseToJson(this);

  @JsonKey(name: '_id', required: false)
  final String bookingId;

  @JsonKey(name: 'statusLessonSchedule', required: false)
  final LessonScheduleStatusDto? statusLessonSchedule;

  @JsonKey(name: 'isCommented', required: false)
  final bool? isCommented;

  @JsonKey(name: 'isReported', required: false)
  final bool? isReported;

  @JsonKey(name: 'idComment', required: false)
  final String? idComment;

  @JsonKey(name: 'link', required: false)
  final String? link;

  @JsonKey(name: 'lesson', required: false)
  final LessonDto? lesson;

  @JsonKey(name: 'reservableDate', required: false)
  final ReservableDateDto? reservableDate;
}

enum LessonScheduleStatusDto {
  @JsonValue(0)
  studying,
  @JsonValue(1)
  completed,
  @JsonValue(2)
  locked,
}
