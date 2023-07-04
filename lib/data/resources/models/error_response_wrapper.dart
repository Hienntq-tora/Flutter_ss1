import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracker/data/resources/models/validation_error_response.dart';

part 'error_response_wrapper.g.dart';

@JsonSerializable()
class ErrorResponseWrapper {
  const ErrorResponseWrapper(this.status, this.message, this.errors);

  factory ErrorResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseWrapperToJson(this);

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errors')
  final List<ValidationErrorResponse>? errors;
}
