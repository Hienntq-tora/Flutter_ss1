class NotificationOutput {
  NotificationOutput({required this.type, required this.link});

  final NotificationType? type;
  final String? link;
}

enum NotificationType {
  payment,
  lessonApproved,
  upComingLesson,
}
