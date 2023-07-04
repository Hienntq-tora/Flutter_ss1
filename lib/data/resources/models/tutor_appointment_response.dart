import 'package:json_annotation/json_annotation.dart';
import 'lesson_dto.dart';
import 'reservable_date_dto.dart';
import 'user_dto.dart';

part 'tutor_appointment_response.g.dart';

@JsonSerializable()
class TutorAppointmentResponse {
  const TutorAppointmentResponse(
    this.id,
    this.student,
    this.lesson,
    this.reservableDate,
    this.isCancel,
  );

  factory TutorAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TutorAppointmentResponseToJson(this);

  @JsonKey(name: '_id', required: false)
  final String id;

  @JsonKey(name: 'student', required: false)
  final UserDto? student;

  @JsonKey(name: 'lesson', required: false)
  final LessonDto? lesson;

  @JsonKey(name: 'reservableDate', required: false)
  final ReservableDateDto? reservableDate;

  @JsonKey(name: 'isCancel', required: false)
  final bool? isCancel;
}
