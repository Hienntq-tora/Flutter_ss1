import 'package:json_annotation/json_annotation.dart';

part 'create_booking_request.g.dart';

@JsonSerializable()
class CreateBookingRequest {
  const CreateBookingRequest(this.lessonId, this.reservableDateId);

  factory CreateBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookingRequestToJson(this);

  @JsonKey(name: 'lessonId', required: true)
  final String lessonId;

  @JsonKey(name: 'reservableDateId', required: true)
  final String reservableDateId;
}
