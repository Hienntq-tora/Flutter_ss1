import '../../ui/screens/tutor_update_lesson/components/tutor_content_tile.dart';

class UpdateLessonInput {
  UpdateLessonInput({
    required this.lessonId,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.fieldId,
    required this.difficulty,
    required this.price,
    required this.linkMeeting,
    required this.content,
  });

  final String? lessonId;
  final String? imageUrl;
  final String title;
  final String description;
  final String fieldId;
  final String difficulty;
  final String price;
  final String linkMeeting;
  final List<TutorContentModel> content;
}
