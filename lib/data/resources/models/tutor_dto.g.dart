// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorDto _$TutorDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id'],
  );
  return TutorDto(
    json['_id'] as String,
    json['email'] as String?,
    json['avatarUrl'] as String,
    json['fullName'] as String?,
    json['countryFlag'] as String?,
    (json['ratings'] as num?)?.toDouble(),
    json['aboutMe'] as String?,
    json['role'] as int?,
    json['profileVideoUrl'] as String?,
    json['location'] as String?,
    (json['languagesSubjects'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    (json['workingExperiences'] as List<dynamic>?)
        ?.map((e) => WorkingExperienceDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['educations'] as List<dynamic>?)
        ?.map((e) => EducationDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['certificates'] as List<dynamic>?)?.map((e) => e as String).toList(),
    (json['commentList'] as List<dynamic>?)
        ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TutorDtoToJson(TutorDto instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'fullName': instance.fullName,
      'countryFlag': instance.countryFlag,
      'ratings': instance.ratings,
      'aboutMe': instance.aboutMe,
      'role': instance.role,
      'profileVideoUrl': instance.profileVideoUrl,
      'location': instance.location,
      'languagesSubjects': instance.languagesSubjects,
      'workingExperiences': instance.workingExperiences,
      'educations': instance.educations,
      'certificates': instance.certificates,
      'commentList': instance.comments,
    };
