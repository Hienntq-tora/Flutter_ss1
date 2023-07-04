import 'package:json_annotation/json_annotation.dart';

part 'create_booking_response.g.dart';

@JsonSerializable()
class CreateBookingResponse {
  const CreateBookingResponse(this.payment);

  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookingResponseToJson(this);

  @JsonKey(name: 'payment', required: true)
  final String? payment;
}
