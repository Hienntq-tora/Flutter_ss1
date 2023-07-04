import 'package:json_annotation/json_annotation.dart';

part 'get_schedule_list_request.g.dart';

@JsonSerializable()
class GetScheduleListRequest {
  const GetScheduleListRequest(this.startTime, this.endTime);

  factory GetScheduleListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetScheduleListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetScheduleListRequestToJson(this);

  @JsonKey(name: 'startTime', required: true)
  final String startTime;

  @JsonKey(name: 'endTime', required: true)
  final String endTime;
}
