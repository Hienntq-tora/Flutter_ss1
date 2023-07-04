// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lessons_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLessonsRequest _$GetLessonsRequestFromJson(Map<String, dynamic> json) =>
    GetLessonsRequest(
      json['filter'] as int?,
      json['password'] as String?,
      json['search'] as String?,
      json['fieldId'] as String?,
      json['difficulty'] as String?,
    );

Map<String, dynamic> _$GetLessonsRequestToJson(GetLessonsRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'password': instance.tutorId,
      'search': instance.search,
      'fieldId': instance.fieldId,
      'difficulty': instance.difficulty,
    };
