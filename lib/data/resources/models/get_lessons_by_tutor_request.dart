import 'package:json_annotation/json_annotation.dart';

part 'get_lessons_by_tutor_request.g.dart';

@JsonSerializable()
class GetLessonsByTutorRequest {
  const GetLessonsByTutorRequest(this.teacherId);

  factory GetLessonsByTutorRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLessonsByTutorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLessonsByTutorRequestToJson(this);

  @JsonKey(name: 'teacherId', required: false)
  final String teacherId;
}
