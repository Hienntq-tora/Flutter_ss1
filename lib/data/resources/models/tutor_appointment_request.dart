import 'package:json_annotation/json_annotation.dart';

part 'tutor_appointment_request.g.dart';

@JsonSerializable()
class TutorAppointmentRequest {
  const TutorAppointmentRequest(
    this.startTime,
    this.endTime,
    this.startSlot,
    this.endSlot,
    this.status,
  );

  factory TutorAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorAppointmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TutorAppointmentRequestToJson(this);

  @JsonKey(name: 'startTime', required: true)
  final String startTime;

  @JsonKey(name: 'endTime', required: true)
  final String endTime;

  @JsonKey(name: 'startSlot', required: true)
  final String startSlot;

  @JsonKey(name: 'endSlot', required: true)
  final String endSlot;

  @JsonKey(name: 'status', required: true)
  final String status;
}
