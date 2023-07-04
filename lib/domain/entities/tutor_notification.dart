import 'package:time_tracker/data/resources/enums/tutor_notification_status.dart';

class TutorNotification {
  TutorNotification({
    required this.id,
    required this.isRead,
    required this.type,
    this.notificationTitle = "",
    required this.notificationTime,
    required this.lessonTitle,
    required this.transactionHash,
    required this.lessonDescription,
    required this.lessonLink,
  });

  final String id;
  final bool isRead;
  final TutorNotificationType? type;
  String notificationTitle;
  final String? notificationTime;
  final String? lessonLink;
  final String? lessonTitle;
  final String? lessonDescription;
  final String? transactionHash;
}
