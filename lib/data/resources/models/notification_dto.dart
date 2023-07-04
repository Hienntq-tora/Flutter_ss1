import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  const NotificationDto({required this.type, this.link});

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  @JsonKey(name: 'type', required: true)
  final NotificationTypeDto? type;

  @JsonKey(name: 'link', required: false)
  final String? link;
}

enum NotificationTypeDto {
  @JsonValue("1")
  payment,
  @JsonValue("2")
  lessonApproved,
  @JsonValue("3")
  upComingLesson,
}
