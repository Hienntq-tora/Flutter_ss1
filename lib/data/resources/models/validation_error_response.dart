import 'package:json_annotation/json_annotation.dart';

part 'validation_error_response.g.dart';

@JsonSerializable()
class ValidationErrorResponse {
  const ValidationErrorResponse(this.field, this.message);

  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorResponseToJson(this);

  @JsonKey(name: 'field', required: true)
  final String field;

  @JsonKey(name: 'message', required: true)
  final String message;
}
