import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/lesson_content.dart';
import 'package:time_tracker/domain/entities/user.dart';

class Lesson {
  const Lesson(
      {required this.id,
      required this.title,
      this.imageUrl,
      this.description,
      this.difficulty,
      this.price,
      this.length,
      this.rating,
      this.dateTime,
      this.user,
      this.linkMeeting,
      this.field,
      this.content});

  final String id;
  final String title;
  final String? imageUrl;
  final String? description;

  final Field? field;
  final String? difficulty;
  final String? price;
  final int? length;

  final List<LessonContent>? content;
  final User? user;
  final double? rating;

  final String? linkMeeting;
  final String? dateTime;
}
