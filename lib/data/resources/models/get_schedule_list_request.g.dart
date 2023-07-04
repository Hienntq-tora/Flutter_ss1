// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_schedule_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetScheduleListRequest _$GetScheduleListRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['startTime', 'endTime'],
  );
  return GetScheduleListRequest(
    json['startTime'] as String,
    json['endTime'] as String,
  );
}

Map<String, dynamic> _$GetScheduleListRequestToJson(
        GetScheduleListRequest instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
