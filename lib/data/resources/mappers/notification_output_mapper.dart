import 'package:time_tracker/domain/entities/notification_output.dart';
import 'package:time_tracker/routes/route_utils.dart';

extension NotificationTypeX on NotificationType {
  String? get toPath {
    switch (this) {
      case NotificationType.payment:
      // TODO: Goto PaymentConfirm
      case NotificationType.lessonApproved:
      // TODO: Goto LessonInfo
      case NotificationType.upComingLesson:
        return AppPage.tutorHome.toPath;
    }
  }

  int? get toIndex {
    switch (this) {
      case NotificationType.payment:
      case NotificationType.lessonApproved:
      case NotificationType.upComingLesson:
        return 2;
    }
  }
}
