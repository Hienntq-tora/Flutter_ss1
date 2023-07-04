import 'package:json_annotation/json_annotation.dart';

part 'update_reservable_date_request.g.dart';

@JsonSerializable()
class UpdateReservableDateRequest {
  const UpdateReservableDateRequest(this.dateTime, this.timeId);

  factory UpdateReservableDateRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReservableDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateReservableDateRequestToJson(this);

  @JsonKey(name: 'datetime', required: true)
  final String dateTime;

  @JsonKey(name: 'timeId', required: true)
  final String timeId;
}
