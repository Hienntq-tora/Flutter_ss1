// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendVerifyOtpRequest _$ResendVerifyOtpRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email'],
  );
  return ResendVerifyOtpRequest(
    json['email'] as String,
  );
}

Map<String, dynamic> _$ResendVerifyOtpRequestToJson(
        ResendVerifyOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
