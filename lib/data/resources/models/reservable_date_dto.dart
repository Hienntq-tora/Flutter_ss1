import 'package:json_annotation/json_annotation.dart';

part 'reservable_date_dto.g.dart';

@JsonSerializable()
class ReservableDateDto {
  const ReservableDateDto(
    this.id,
    this.tutor,
    this.timeId,
    this.datetime,
    this.timeString,
    this.isReservated,
  );

  factory ReservableDateDto.fromJson(Map<String, dynamic> json) =>
      _$ReservableDateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReservableDateDtoToJson(this);

  @JsonKey(name: '_id', required: false)
  final String? id;

  @JsonKey(name: 'tutor', required: false)
  final String? tutor;

  @JsonKey(name: 'timeId', required: false)
  final int? timeId;

  @JsonKey(name: 'datetime', required: false)
  final String? datetime;

  @JsonKey(name: 'timeString', required: false)
  final String? timeString;

  @JsonKey(name: 'isReservated', required: false)
  final bool? isReservated;
}
