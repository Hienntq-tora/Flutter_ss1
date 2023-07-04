// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorAppointmentRequest _$TutorAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'startTime',
      'endTime',
      'startSlot',
      'endSlot',
      'status'
    ],
  );
  return TutorAppointmentRequest(
    json['startTime'] as String,
    json['endTime'] as String,
    json['startSlot'] as String,
    json['endSlot'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$TutorAppointmentRequestToJson(
        TutorAppointmentRequest instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'startSlot': instance.startSlot,
      'endSlot': instance.endSlot,
      'status': instance.status,
    };
