// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationErrorResponse _$ValidationErrorResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['field', 'message'],
  );
  return ValidationErrorResponse(
    json['field'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$ValidationErrorResponseToJson(
        ValidationErrorResponse instance) =>
    <String, dynamic>{
      'field': instance.field,
      'message': instance.message,
    };
