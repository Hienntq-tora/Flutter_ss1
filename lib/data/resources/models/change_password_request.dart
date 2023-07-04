import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  const ChangePasswordRequest(this.email, this.oldPassword, this.password);

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'oldPassword', required: true)
  final String oldPassword;

  @JsonKey(name: 'password', required: true)
  final String password;
}
