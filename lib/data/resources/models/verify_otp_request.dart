import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOtpRequest {
  const VerifyOtpRequest(this.email, this.otp);

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'otp', required: true)
  final String otp;
}
