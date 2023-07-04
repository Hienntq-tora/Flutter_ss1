import 'package:time_tracker/data/resources/models/delete_tutor_lesson_request.dart';
import 'package:time_tracker/domain/entities/delete_tutor_leson_input.dart';

extension DeleteTutorLessonRequestX on DeleteTutorLessonInput {
  DeleteTutorLessonRequest toDto() {
    return DeleteTutorLessonRequest(lessonId);
  }
}
