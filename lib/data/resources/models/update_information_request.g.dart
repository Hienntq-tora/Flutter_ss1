// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_information_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInformationRequest _$UpdateInformationRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['firstName', 'lastName'],
  );
  return UpdateInformationRequest(
    json['firstName'] as String,
    json['lastName'] as String,
    json['avatar'] as String?,
  );
}

Map<String, dynamic> _$UpdateInformationRequestToJson(
        UpdateInformationRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatarUrl,
    };
