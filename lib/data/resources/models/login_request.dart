import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  const LoginRequest(this.email, this.password, this.fcmRefreshToken);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'password', required: true)
  final String password;

  @JsonKey(name: 'fcmRefreshToken', required: true)
  final String fcmRefreshToken;
}
