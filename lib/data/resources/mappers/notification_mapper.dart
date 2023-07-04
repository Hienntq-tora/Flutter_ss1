import 'package:time_tracker/data/resources/models/notification_dto.dart';
import 'package:time_tracker/domain/entities/notification_output.dart';

extension NotificationX on NotificationDto {
  NotificationOutput toEntity() {
    return NotificationOutput(
      type: type?.toEntity(),
      link: link,
    );
  }
}

extension NotificationTypeDtoX on NotificationTypeDto {
  NotificationType toEntity() {
    switch (this) {
      case NotificationTypeDto.payment:
        return NotificationType.payment;
      case NotificationTypeDto.lessonApproved:
        return NotificationType.lessonApproved;
      case NotificationTypeDto.upComingLesson:
        return NotificationType.upComingLesson;
    }
  }
}
