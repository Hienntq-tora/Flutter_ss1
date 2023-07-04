// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_cancel_appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorCancelAppointmentRequest _$TutorCancelAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['cancelReason'],
  );
  return TutorCancelAppointmentRequest(
    json['cancelReason'] as String,
    json['isCancel'] as bool,
  );
}

Map<String, dynamic> _$TutorCancelAppointmentRequestToJson(
        TutorCancelAppointmentRequest instance) =>
    <String, dynamic>{
      'isCancel': instance.isCancel,
      'cancelReason': instance.cancelReason,
    };
