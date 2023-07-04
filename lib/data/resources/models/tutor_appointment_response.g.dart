// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorAppointmentResponse _$TutorAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    TutorAppointmentResponse(
      json['_id'] as String,
      json['student'] == null
          ? null
          : UserDto.fromJson(json['student'] as Map<String, dynamic>),
      json['lesson'] == null
          ? null
          : LessonDto.fromJson(json['lesson'] as Map<String, dynamic>),
      json['reservableDate'] == null
          ? null
          : ReservableDateDto.fromJson(
              json['reservableDate'] as Map<String, dynamic>),
      json['isCancel'] as bool?,
    );

Map<String, dynamic> _$TutorAppointmentResponseToJson(
        TutorAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'student': instance.student,
      'lesson': instance.lesson,
      'reservableDate': instance.reservableDate,
      'isCancel': instance.isCancel,
    };
