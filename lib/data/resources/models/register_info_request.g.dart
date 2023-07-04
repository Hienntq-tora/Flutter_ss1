// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInfoRequest _$RegisterInfoRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['firstName', 'lastName', 'email', 'password', 'role'],
  );
  return RegisterInfoRequest(
    json['email'] as String,
    json['password'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['role'] as int,
    json['avatar'] as String?,
  );
}

Map<String, dynamic> _$RegisterInfoRequestToJson(
        RegisterInfoRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'avatar': instance.avatar,
    };
