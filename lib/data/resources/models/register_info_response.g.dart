// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInfoResponse _$RegisterInfoResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterInfoResponse(
      json['_id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['avatarUrl'] as String,
    );

Map<String, dynamic> _$RegisterInfoResponseToJson(
        RegisterInfoResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
    };
