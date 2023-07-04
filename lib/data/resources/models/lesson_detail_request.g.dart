// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDetailRequest _$LessonDetailRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lessonId'],
  );
  return LessonDetailRequest(
    json['lessonId'] as String,
  );
}

Map<String, dynamic> _$LessonDetailRequestToJson(
        LessonDetailRequest instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
    };
