// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id', 'title'],
  );
  return LessonDto(
    id: json['_id'] as String,
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String?,
    description: json['description'] as String?,
    difficulty: json['difficulty'] as String?,
    price: json['price'] as String?,
    length: json['length'] as int?,
    rating: (json['rating'] as num?)?.toDouble(),
    dateTime: json['dateTime'] as String?,
    user: json['user'] == null
        ? null
        : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    linkMeeting: json['linkMeeting'] as String?,
    content: (json['content'] as List<dynamic>?)
        ?.map((e) => LessonContentDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    field: json['field'] == null
        ? null
        : FieldDto.fromJson(json['field'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'field': instance.field,
      'difficulty': instance.difficulty,
      'price': instance.price,
      'length': instance.length,
      'content': instance.content,
      'user': instance.user,
      'rating': instance.rating,
      'linkMeeting': instance.linkMeeting,
      'dateTime': instance.dateTime,
    };
