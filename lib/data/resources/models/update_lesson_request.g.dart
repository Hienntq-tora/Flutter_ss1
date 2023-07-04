// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_lesson_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLessonRequest _$UpdateLessonRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'title',
      'description',
      'fieldId',
      'content',
      'difficulty',
      'price',
      'linkMeeting'
    ],
  );
  return UpdateLessonRequest(
    lessonId: json['lessonId'] as String?,
    imageUrl: json['imageUrl'] as String?,
    title: json['title'] as String,
    description: json['description'] as String,
    fieldId: json['fieldId'] as String,
    content: json['content'] as String,
    difficulty: json['difficulty'] as String,
    price: json['price'] as String,
    linkMeeting: json['linkMeeting'] as String,
  );
}

Map<String, dynamic> _$UpdateLessonRequestToJson(UpdateLessonRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lessonId', instance.lessonId);
  writeNotNull('imageUrl', instance.imageUrl);
  val['title'] = instance.title;
  val['description'] = instance.description;
  val['fieldId'] = instance.fieldId;
  val['content'] = instance.content;
  val['difficulty'] = instance.difficulty;
  val['price'] = instance.price;
  val['linkMeeting'] = instance.linkMeeting;
  return val;
}
