import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  const ResetPasswordRequest(this.email, this.password);

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'password', required: true)
  final String password;
}
