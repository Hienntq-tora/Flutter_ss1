import 'package:json_annotation/json_annotation.dart';

part 'education_dto.g.dart';

@JsonSerializable()
class EducationDto {
  const EducationDto(this.title, this.description);

  factory EducationDto.fromJson(Map<String, dynamic> json) =>
      _$EducationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EducationDtoToJson(this);

  final String title;
  final String? description;
}