// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id', 'token', 'refreshToken'],
  );
  return LoginResponse(
    json['token'] as String,
    json['refreshToken'] as String,
    json['firstName'] as String?,
    json['lastName'] as String?,
    json['avatarUrl'] as String?,
    json['email'] as String?,
    $enumDecode(_$UserRoleDtoEnumMap, json['role']),
    json['_id'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'role': _$UserRoleDtoEnumMap[instance.role]!,
    };

const _$UserRoleDtoEnumMap = {
  UserRoleDto.admin: 1,
  UserRoleDto.tutor: 2,
  UserRoleDto.student: 3,
};
