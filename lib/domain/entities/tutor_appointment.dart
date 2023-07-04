import 'lesson.dart';
import 'reservable_date.dart';
import 'user.dart';

class TutorAppointment {
  TutorAppointment({
    required this.id,
    required this.isCancel,
    required this.student,
    required this.lesson,
    required this.reservableDate,
  });

  final String? id;
  final bool? isCancel;
  final User? student;
  final Lesson? lesson;
  final ReservableDate? reservableDate;
}
