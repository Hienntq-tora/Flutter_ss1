import 'package:json_annotation/json_annotation.dart';

part 'lesson_content_dto.g.dart';

@JsonSerializable()
class LessonContentDto {
  const LessonContentDto(this.title, this.description);

  factory LessonContentDto.fromJson(Map<String, dynamic> json) =>
      _$LessonContentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LessonContentDtoToJson(this);

  @JsonKey(name: 'title', required: false)
  final String? title;

  @JsonKey(name: 'description', required: false)
  final String? description;
}
