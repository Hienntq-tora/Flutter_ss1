// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_fcm_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterFcmTokenRequest _$RegisterFcmTokenRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['token'],
  );
  return RegisterFcmTokenRequest(
    json['token'] as String,
  );
}

Map<String, dynamic> _$RegisterFcmTokenRequestToJson(
        RegisterFcmTokenRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
