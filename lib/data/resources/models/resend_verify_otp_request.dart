import 'package:json_annotation/json_annotation.dart';

part 'resend_verify_otp_request.g.dart';

@JsonSerializable()
class ResendVerifyOtpRequest {
  const ResendVerifyOtpRequest(this.email);

  factory ResendVerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendVerifyOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResendVerifyOtpRequestToJson(this);

  @JsonKey(name: 'email', required: true)
  final String email;
}
