import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracker/data/resources/models/field_dto.dart';
import 'package:time_tracker/data/resources/models/lesson_content_dto.dart';
import 'package:time_tracker/data/resources/models/user_dto.dart';

part 'lesson_dto.g.dart';

@JsonSerializable()
class LessonDto {
  const LessonDto(
      {required this.id,
      required this.title,
      this.imageUrl,
      this.description,
      this.difficulty,
      this.price,
      this.length,
      this.rating,
      this.dateTime,
      this.user,
      this.linkMeeting,
      this.content,
      this.field});

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'title', required: true)
  final String title;

  @JsonKey(name: 'imageUrl', required: false)
  final String? imageUrl;

  @JsonKey(name: 'description', required: false)
  final String? description;

  @JsonKey(name: 'field', required: false)
  final FieldDto? field;

  @JsonKey(name: 'difficulty', required: false)
  final String? difficulty;

  @JsonKey(name: 'price', required: false)
  final String? price;

  @JsonKey(name: 'length', required: false)
  final int? length;

  @JsonKey(name: 'content', required: false)
  final List<LessonContentDto>? content;

  @JsonKey(name: 'user', required: false)
  final UserDto? user;

  @JsonKey(name: 'rating', required: false)
  final double? rating;

  @JsonKey(name: 'linkMeeting', required: false)
  final String? linkMeeting;

  @JsonKey(name: 'dateTime', required: false)
  final String? dateTime;
}
