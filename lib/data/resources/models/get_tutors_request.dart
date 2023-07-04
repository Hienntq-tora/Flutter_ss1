import 'package:json_annotation/json_annotation.dart';

part 'get_tutors_request.g.dart';

@JsonSerializable()
class GetTutorsRequest {
  const GetTutorsRequest(this.search);

  factory GetTutorsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTutorsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetTutorsRequestToJson(this);

  @JsonKey(name: 'search', required: false)
  final String? search;
}
