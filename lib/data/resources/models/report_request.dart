import 'package:json_annotation/json_annotation.dart';

part 'report_request.g.dart';

@JsonSerializable()
class ReportRequest {
  const ReportRequest(this.lessonId, this.reportType, this.description);

  factory ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReportRequestToJson(this);

  @JsonKey(name: 'lessonId', required: true)
  final String? lessonId;

  @JsonKey(name: 'reportType', required: true)
  final String reportType;

  @JsonKey(name: 'description', required: true)
  final String? description;
}
