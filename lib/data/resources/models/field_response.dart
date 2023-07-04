import 'package:json_annotation/json_annotation.dart';

part 'field_response.g.dart';

@JsonSerializable()
class FieldResponse {
  FieldResponse({this.sId, this.fieldName, this.description});

  factory FieldResponse.fromJson(Map<String, dynamic> json) =>
      _$FieldResponseFromJson(json);

  Map<String?, dynamic> toJson() => _$FieldResponseToJson(this);

  @JsonKey(name: '_id', required: false)
  final String? sId;

  @JsonKey(name: 'fieldName', required: false)
  final String? fieldName;

  @JsonKey(name: 'description', required: false)
  final String? description;
}
