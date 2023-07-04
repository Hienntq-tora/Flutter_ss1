import 'package:json_annotation/json_annotation.dart';

part 'get_reservable_date_request.g.dart';

@JsonSerializable()
class GetReservableDateRequest {
  const GetReservableDateRequest(this.tutorId);

  factory GetReservableDateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetReservableDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetReservableDateRequestToJson(this);

  @JsonKey(name: 'tutorId', required: true)
  final String tutorId;
}
