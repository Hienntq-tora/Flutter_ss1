// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWrapper<T> _$ResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  $checkKeys(
    json,
    requiredKeys: const ['status', 'message'],
  );
  return ResponseWrapper<T>(
    json['status'] as int,
    json['message'] as String,
    fromJsonT(json['data']),
  );
}

Map<String, dynamic> _$ResponseWrapperToJson<T>(
  ResponseWrapper<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
