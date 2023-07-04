import 'package:json_annotation/json_annotation.dart';

part 'tutor_notification_dto.g.dart';

@JsonSerializable()
class TutorNotificationDto {
  const TutorNotificationDto({
    required this.id,
    required this.isRead,
    required this.type,
    required this.datetime,
    this.title,
    this.description,
    this.link,
    this.transactionHash,
  });

  factory TutorNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$TutorNotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TutorNotificationDtoToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'isRead', required: true)
  final bool isRead;

  @JsonKey(name: 'type', required: false)
  final TutorNotificationTypeDto? type;

  @JsonKey(name: 'datetime', required: true)
  final String? datetime;

  @JsonKey(name: 'title', required: false)
  final String? title;

  @JsonKey(name: 'transaction_hash', required: false)
  final String? transactionHash;

  @JsonKey(name: 'description', required: false)
  final String? description;

  @JsonKey(name: 'link', required: false)
  final String? link;
}

enum TutorNotificationTypeDto {
  @JsonValue(1)
  payment,
  @JsonValue(2)
  lessonApproved,
  @JsonValue(3)
  upComingLesson,
}
