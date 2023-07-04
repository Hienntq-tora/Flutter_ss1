enum LessonScheduleStatus {
  studying,
  completed,
  locked;
}

extension LessonScheduleStatusX on LessonScheduleStatus {
  String get toName {
    switch (this) {
      case LessonScheduleStatus.studying:
        return "Studying";
      case LessonScheduleStatus.completed:
        return "Completed";
      case LessonScheduleStatus.locked:
        return "Locked";
    }
  }
}
