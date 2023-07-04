// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorDetailRequest _$TutorDetailRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['user'],
  );
  return TutorDetailRequest(
    json['user'] as String,
  );
}

Map<String, dynamic> _$TutorDetailRequestToJson(TutorDetailRequest instance) =>
    <String, dynamic>{
      'user': instance.id,
    };
