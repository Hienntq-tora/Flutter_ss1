import 'package:json_annotation/json_annotation.dart';

part 'get_lessons_request.g.dart';

@JsonSerializable()
class GetLessonsRequest {
  const GetLessonsRequest(
      this.filter, this.tutorId, this.search, this.fieldId, this.difficulty);

  factory GetLessonsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLessonsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLessonsRequestToJson(this);

  @JsonKey(name: 'filter', required: false)
  final int? filter;

  @JsonKey(name: 'password', required: false)
  final String? tutorId;

  @JsonKey(name: 'search', required: false)
  final String? search;

  @JsonKey(name: 'fieldId', required: false)
  final String? fieldId;

  @JsonKey(name: 'difficulty', required: false)
  final String? difficulty;
}
