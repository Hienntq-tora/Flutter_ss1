// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reservable_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReservableDateRequest _$UpdateReservableDateRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['datetime', 'timeId'],
  );
  return UpdateReservableDateRequest(
    json['datetime'] as String,
    json['timeId'] as String,
  );
}

Map<String, dynamic> _$UpdateReservableDateRequestToJson(
        UpdateReservableDateRequest instance) =>
    <String, dynamic>{
      'datetime': instance.dateTime,
      'timeId': instance.timeId,
    };
