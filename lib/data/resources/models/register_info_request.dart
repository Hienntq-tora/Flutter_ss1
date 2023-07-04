import 'package:json_annotation/json_annotation.dart';

part 'register_info_request.g.dart';

@JsonSerializable()
class RegisterInfoRequest {
  const RegisterInfoRequest(
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
    this.avatar,
  );

  factory RegisterInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterInfoRequestToJson(this);

  @JsonKey(name: 'firstName', required: true)
  final String firstName;

  @JsonKey(name: 'lastName', required: true)
  final String lastName;

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'password', required: true)
  final String password;

  @JsonKey(name: 'role', required: true)
  final int role;

  @JsonKey(name: 'avatar', required: false)
  final String? avatar;
}
