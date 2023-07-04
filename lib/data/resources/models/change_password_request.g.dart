// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'oldPassword', 'password'],
  );
  return ChangePasswordRequest(
    json['email'] as String,
    json['oldPassword'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'oldPassword': instance.oldPassword,
      'password': instance.password,
    };
