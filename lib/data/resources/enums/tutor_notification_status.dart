enum TutorNotificationType {
  payment,
  lessonApproved,
  upComingLesson,
}

extension TutorNotificationTypeX on TutorNotificationType {
  String get toName {
    switch (this) {
      case TutorNotificationType.payment:
        return "Require payment confirmation";
      case TutorNotificationType.lessonApproved:
        return "Lesson is allowed by admin";
      case TutorNotificationType.upComingLesson:
        return "Up coming lesson";
    }
  }
}
