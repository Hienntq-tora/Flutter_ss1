// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingResponse _$CreateBookingResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['payment'],
  );
  return CreateBookingResponse(
    json['payment'] as String?,
  );
}

Map<String, dynamic> _$CreateBookingResponseToJson(
        CreateBookingResponse instance) =>
    <String, dynamic>{
      'payment': instance.payment,
    };
