import 'package:time_tracker/data/resources/enums/tutor_notification_status.dart';
import 'package:time_tracker/data/resources/models/tutor_notification_dto.dart';
import 'package:time_tracker/domain/entities/tutor_notification.dart';

extension TutorNotificationDtoX on TutorNotificationDto {
  TutorNotification toEntity() {
    return TutorNotification(
      id: id,
      isRead: isRead,
      type: type?.toEntity(),
      notificationTime: datetime,
      lessonTitle: title,
      transactionHash: transactionHash,
      lessonDescription: description,
      lessonLink: link,
    );
  }
}

extension TutorNotificatioTypeDtoX on TutorNotificationTypeDto {
  TutorNotificationType toEntity() {
    switch (this) {
      case TutorNotificationTypeDto.payment:
        return TutorNotificationType.payment;
      case TutorNotificationTypeDto.lessonApproved:
        return TutorNotificationType.lessonApproved;
      case TutorNotificationTypeDto.upComingLesson:
        return TutorNotificationType.upComingLesson;
    }
  }
}
