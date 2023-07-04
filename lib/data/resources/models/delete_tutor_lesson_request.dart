import 'package:json_annotation/json_annotation.dart';

part 'delete_tutor_lesson_request.g.dart';

@JsonSerializable()
class DeleteTutorLessonRequest {
  const DeleteTutorLessonRequest(this.lessonId);

  factory DeleteTutorLessonRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteTutorLessonRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTutorLessonRequestToJson(this);

  @JsonKey(name: 'lessonId', required: true)
  final String lessonId;
}
