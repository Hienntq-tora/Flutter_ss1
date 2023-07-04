// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonHistoryResponse _$LessonHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    LessonHistoryResponse(
      json['_id'] as String,
      $enumDecodeNullable(
          _$LessonScheduleStatusDtoEnumMap, json['statusLessonSchedule']),
      json['isCommented'] as bool?,
      json['isReported'] as bool?,
      json['idComment'] as String?,
      json['link'] as String?,
      json['lesson'] == null
          ? null
          : LessonDto.fromJson(json['lesson'] as Map<String, dynamic>),
      json['reservableDate'] == null
          ? null
          : ReservableDateDto.fromJson(
              json['reservableDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonHistoryResponseToJson(
        LessonHistoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.bookingId,
      'statusLessonSchedule':
          _$LessonScheduleStatusDtoEnumMap[instance.statusLessonSchedule],
      'isCommented': instance.isCommented,
      'isReported': instance.isReported,
      'idComment': instance.idComment,
      'link': instance.link,
      'lesson': instance.lesson,
      'reservableDate': instance.reservableDate,
    };

const _$LessonScheduleStatusDtoEnumMap = {
  LessonScheduleStatusDto.studying: 0,
  LessonScheduleStatusDto.completed: 1,
  LessonScheduleStatusDto.locked: 2,
};
