import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  const LoginResponse(this.token, this.refreshToken, this.firstName,
      this.lastName, this.avatarUrl, this.email, this.role, this.id);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'token', required: true)
  final String token;

  @JsonKey(name: 'refreshToken', required: true)
  final String refreshToken;

  @JsonKey(name: 'firstName', required: false)
  final String? firstName;

  @JsonKey(name: 'lastName', required: false)
  final String? lastName;

  @JsonKey(name: 'avatarUrl', required: false)
  final String? avatarUrl;

  @JsonKey(name: 'email', required: false)
  final String? email;

  @JsonKey(name: 'role', required: false)
  final UserRoleDto role;
}

enum UserRoleDto {
  @JsonValue(1)
  admin,
  @JsonValue(2)
  tutor,
  @JsonValue(3)
  student,
}
