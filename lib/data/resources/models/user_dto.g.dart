// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['_id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['userInfo'] == null
          ? null
          : UserInfoDto.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userInfo': instance.userInfo,
    };

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => UserInfoDto(
      json['countryFlag'] as String?,
      json['_id'] as String?,
      json['avatarUrl'] as String?,
      (json['ratings'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserInfoDtoToJson(UserInfoDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'countryFlag': instance.countryFlag,
      'ratings': instance.ratings,
    };
