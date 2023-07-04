import 'package:json_annotation/json_annotation.dart';

part 'register_info_response.g.dart';

@JsonSerializable()
class RegisterInfoResponse {
  const RegisterInfoResponse(
      this.id, this.firstName, this.lastName, this.email, this.avatarUrl);

  factory RegisterInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterInfoResponseToJson(this);

  @JsonKey(name: '_id', required: false)
  final String id;

  @JsonKey(name: 'firstName', required: false)
  final String firstName;

  @JsonKey(name: 'lastName', required: false)
  final String lastName;

  @JsonKey(name: 'email', required: false)
  final String email;

  @JsonKey(name: 'avatarUrl', required: false)
  final String avatarUrl;
}
