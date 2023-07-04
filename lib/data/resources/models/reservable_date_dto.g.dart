// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservable_date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservableDateDto _$ReservableDateDtoFromJson(Map<String, dynamic> json) =>
    ReservableDateDto(
      json['_id'] as String?,
      json['tutor'] as String?,
      json['timeId'] as int?,
      json['datetime'] as String?,
      json['timeString'] as String?,
      json['isReservated'] as bool?,
    );

Map<String, dynamic> _$ReservableDateDtoToJson(ReservableDateDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'tutor': instance.tutor,
      'timeId': instance.timeId,
      'datetime': instance.datetime,
      'timeString': instance.timeString,
      'isReservated': instance.isReservated,
    };
