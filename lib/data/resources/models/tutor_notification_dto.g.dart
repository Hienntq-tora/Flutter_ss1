// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorNotificationDto _$TutorNotificationDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id', 'isRead', 'datetime'],
  );
  return TutorNotificationDto(
    id: json['_id'] as String,
    isRead: json['isRead'] as bool,
    type: $enumDecodeNullable(_$TutorNotificationTypeDtoEnumMap, json['type']),
    datetime: json['datetime'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    link: json['link'] as String?,
    transactionHash: json['transaction_hash'] as String?,
  );
}

Map<String, dynamic> _$TutorNotificationDtoToJson(
        TutorNotificationDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isRead': instance.isRead,
      'type': _$TutorNotificationTypeDtoEnumMap[instance.type],
      'datetime': instance.datetime,
      'title': instance.title,
      'transaction_hash': instance.transactionHash,
      'description': instance.description,
      'link': instance.link,
    };

const _$TutorNotificationTypeDtoEnumMap = {
  TutorNotificationTypeDto.payment: 1,
  TutorNotificationTypeDto.lessonApproved: 2,
  TutorNotificationTypeDto.upComingLesson: 3,
};
