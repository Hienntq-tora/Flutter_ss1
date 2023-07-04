// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookingRequest _$CreateBookingRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lessonId', 'reservableDateId'],
  );
  return CreateBookingRequest(
    json['lessonId'] as String,
    json['reservableDateId'] as String,
  );
}

Map<String, dynamic> _$CreateBookingRequestToJson(
        CreateBookingRequest instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'reservableDateId': instance.reservableDateId,
    };
