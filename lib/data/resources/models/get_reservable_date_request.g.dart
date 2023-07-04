// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reservable_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReservableDateRequest _$GetReservableDateRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['tutorId'],
  );
  return GetReservableDateRequest(
    json['tutorId'] as String,
  );
}

Map<String, dynamic> _$GetReservableDateRequestToJson(
        GetReservableDateRequest instance) =>
    <String, dynamic>{
      'tutorId': instance.tutorId,
    };
