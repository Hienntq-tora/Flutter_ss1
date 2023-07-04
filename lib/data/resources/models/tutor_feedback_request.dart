import 'package:json_annotation/json_annotation.dart';

part 'tutor_feedback_request.g.dart';

@JsonSerializable()
class GetFeedbackRequest {
  const GetFeedbackRequest(this.description);

  factory GetFeedbackRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedbackRequestToJson(this);

  @JsonKey(name: 'description', required: true)
  final String? description;
}
