// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_tutor_lesson_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteTutorLessonRequest _$DeleteTutorLessonRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lessonId'],
  );
  return DeleteTutorLessonRequest(
    json['lessonId'] as String,
  );
}

Map<String, dynamic> _$DeleteTutorLessonRequestToJson(
        DeleteTutorLessonRequest instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
    };
