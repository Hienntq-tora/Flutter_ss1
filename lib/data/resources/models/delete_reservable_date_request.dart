import 'package:json_annotation/json_annotation.dart';

part 'delete_reservable_date_request.g.dart';

@JsonSerializable()
class DeleteReservableDateRequest {
  const DeleteReservableDateRequest(this.datetime);

  factory DeleteReservableDateRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteReservableDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteReservableDateRequestToJson(this);

  @JsonKey(name: 'datetime', required: true)
  final String datetime;
}
