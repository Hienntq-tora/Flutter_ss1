import 'package:json_annotation/json_annotation.dart';

part 'working_experience_dto.g.dart';

@JsonSerializable()
class WorkingExperienceDto {
  const WorkingExperienceDto(
      this.title,
      this.description,);

  factory WorkingExperienceDto.fromJson(Map<String, dynamic> json) =>
      _$WorkingExperienceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingExperienceDtoToJson(this);

  @JsonKey(name: 'title', required: true)
  final String title;

  @JsonKey(name: 'description', required: false)
  final String? description;
}