import 'package:json_annotation/json_annotation.dart';

part 'lesson_detail_request.g.dart';

@JsonSerializable()
class LessonDetailRequest {
  const LessonDetailRequest(this.lessonId);

  factory LessonDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$LessonDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LessonDetailRequestToJson(this);

  @JsonKey(name: 'lessonId', required: true)
  final String lessonId;
}
