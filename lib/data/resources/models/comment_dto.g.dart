// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id', 'email'],
  );
  return CommentDto(
    json['_id'] as String,
    json['fullName'] as String?,
    json['email'] as String,
    json['avataUrl'] as String?,
    json['comment'] as String?,
    (json['rating'] as num?)?.toDouble(),
    json['createdAt'] as String?,
  );
}

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'avataUrl': instance.avatar,
      'comment': instance.content,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
    };
