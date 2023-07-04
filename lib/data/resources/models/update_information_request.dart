import 'package:json_annotation/json_annotation.dart';

part 'update_information_request.g.dart';

@JsonSerializable()
class UpdateInformationRequest {
  const UpdateInformationRequest(this.firstName, this.lastName, this.avatarUrl);

  factory UpdateInformationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInformationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInformationRequestToJson(this);

  @JsonKey(name: 'firstName', required: true)
  final String firstName;

  @JsonKey(name: 'lastName', required: true)
  final String lastName;

  @JsonKey(name: 'avatar', required: false)
  final String? avatarUrl;
}
