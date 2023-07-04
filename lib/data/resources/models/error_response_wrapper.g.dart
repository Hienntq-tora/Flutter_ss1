// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseWrapper _$ErrorResponseWrapperFromJson(
        Map<String, dynamic> json) =>
    ErrorResponseWrapper(
      json['status'] as int?,
      json['message'] as String?,
      (json['errors'] as List<dynamic>?)
          ?.map((e) =>
              ValidationErrorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseWrapperToJson(
        ErrorResponseWrapper instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
