import 'package:json_annotation/json_annotation.dart';

part 'update_lesson_request.g.dart';

@JsonSerializable()
class UpdateLessonRequest {
  const UpdateLessonRequest({
    this.lessonId,
    this.imageUrl,
    required this.title,
    required this.description,
    required this.fieldId,
    required this.content,
    required this.difficulty,
    required this.price,
    required this.linkMeeting,
  });

  factory UpdateLessonRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLessonRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLessonRequestToJson(this);

  @JsonKey(name: 'lessonId', includeIfNull: false)
  final String? lessonId;

  @JsonKey(name: 'imageUrl', includeIfNull: false)
  final String? imageUrl;

  @JsonKey(name: 'title', required: true)
  final String title;

  @JsonKey(name: 'description', required: true)
  final String description;

  @JsonKey(name: 'fieldId', required: true)
  final String fieldId;

  @JsonKey(name: 'content', required: true)
  final String content;

  @JsonKey(name: 'difficulty', required: true)
  final String difficulty;

  @JsonKey(name: 'price', required: true)
  final String price;

  @JsonKey(name: 'linkMeeting', required: true)
  final String linkMeeting;
}
