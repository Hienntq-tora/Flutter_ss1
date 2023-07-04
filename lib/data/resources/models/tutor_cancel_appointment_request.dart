import 'package:json_annotation/json_annotation.dart';

part 'tutor_cancel_appointment_request.g.dart';

@JsonSerializable()
class TutorCancelAppointmentRequest {
  const TutorCancelAppointmentRequest(this.cancelReason, this.isCancel);

  factory TutorCancelAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorCancelAppointmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TutorCancelAppointmentRequestToJson(this);

  @JsonKey(name: 'isCancel', required: false)
  final bool isCancel;

  @JsonKey(name: 'cancelReason', required: true)
  final String cancelReason;
}
