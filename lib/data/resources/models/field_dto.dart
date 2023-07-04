import 'package:json_annotation/json_annotation.dart';

part 'field_dto.g.dart';

@JsonSerializable()
class FieldDto {
  const FieldDto({
    required this.id,
    required this.name,
    this.description,
  });

  factory FieldDto.fromJson(Map<String, dynamic> json) =>
      _$FieldDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FieldDtoToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'fieldName', required: true)
  final String name;

  @JsonKey(name: 'description', required: false)
  final String? description;
}
