// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['type'],
  );
  return NotificationDto(
    type: $enumDecodeNullable(_$NotificationTypeDtoEnumMap, json['type']),
    link: json['link'] as String?,
  );
}

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeDtoEnumMap[instance.type],
      'link': instance.link,
    };

const _$NotificationTypeDtoEnumMap = {
  NotificationTypeDto.payment: '1',
  NotificationTypeDto.lessonApproved: '2',
  NotificationTypeDto.upComingLesson: '3',
};
