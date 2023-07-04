// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_reservable_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteReservableDateRequest _$DeleteReservableDateRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['datetime'],
  );
  return DeleteReservableDateRequest(
    json['datetime'] as String,
  );
}

Map<String, dynamic> _$DeleteReservableDateRequestToJson(
        DeleteReservableDateRequest instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
    };
