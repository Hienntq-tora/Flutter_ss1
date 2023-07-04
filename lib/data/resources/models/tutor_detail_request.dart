import 'package:json_annotation/json_annotation.dart';

part 'tutor_detail_request.g.dart';

@JsonSerializable()
class TutorDetailRequest {
  const TutorDetailRequest(this.id);

  factory TutorDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TutorDetailRequestToJson(this);

  @JsonKey(name: 'user', required: true)
  final String id;
}
