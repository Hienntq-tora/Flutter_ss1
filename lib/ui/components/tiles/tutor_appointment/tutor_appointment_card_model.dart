class TutorAppoinmentCardSection {
  TutorAppoinmentCardSection({
    required this.day,
    required this.date,
    required this.appointmentList,
  });

  final String day;
  final String date;

  List<TutorAppoimentCardItem> appointmentList;
}

class TutorAppoimentCardItem {
  TutorAppoimentCardItem({
    required this.appointmentId,
    required this.title,
    required this.lessonImageUrl,
    required this.studentImageUrl,
    required this.difficulty,
    required this.timeSlot,
    required this.fullName,
    required this.linkMeeting,
  });

  final String appointmentId;
  final String title;
  final String? lessonImageUrl;
  final String? studentImageUrl;
  final String difficulty;
  final String timeSlot;
  final String fullName;
  final String linkMeeting;
}
