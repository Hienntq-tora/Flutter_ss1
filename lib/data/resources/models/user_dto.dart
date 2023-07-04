import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  const UserDto(
    this.id,
    this.firstName,
    this.lastName,
    this.userInfo,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: '_id', required: false)
  final String? id;

  @JsonKey(name: 'firstName', required: false)
  final String? firstName;

  @JsonKey(name: 'lastName', required: false)
  final String? lastName;

  @JsonKey(name: 'userInfo', required: false)
  final UserInfoDto? userInfo;
}

@JsonSerializable()
class UserInfoDto {
  const UserInfoDto(
    this.countryFlag,
    this.id,
    this.avatarUrl,
    this.ratings,
  );

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);

  @JsonKey(name: '_id', required: false)
  final String? id;

  @JsonKey(name: 'avatarUrl', required: false)
  final String? avatarUrl;

  @JsonKey(name: 'countryFlag', required: false)
  final String? countryFlag;

  @JsonKey(name: 'ratings', required: false)
  final double? ratings;
}
