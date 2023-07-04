// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_experience_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingExperienceDto _$WorkingExperienceDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['title'],
  );
  return WorkingExperienceDto(
    json['title'] as String,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$WorkingExperienceDtoToJson(
        WorkingExperienceDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
