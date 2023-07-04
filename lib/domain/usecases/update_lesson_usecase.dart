import 'package:time_tracker/domain/entities/update_lesson_input.dart';
import '../../ui/screens/tutor_update_lesson/components/tutor_content_tile.dart';
import '../entities/default_output.dart';
import '../repositories/app_repository.dart';
import 'usecase.dart';

class UpdateLessonUseCase extends UseCase<DefaultOutput, UpdateLessonParams> {
  final AppRepository repository;

  const UpdateLessonUseCase(this.repository);

  @override
  Future<DefaultOutput> call(UpdateLessonParams params) async {
    return await repository.updateLesson(
      UpdateLessonInput(
        lessonId: params.lessonId,
        imageUrl: params.imageUrl,
        title: params.title,
        description: params.description,
        fieldId: params.fieldId,
        difficulty: params.difficulty,
        price: params.price,
        linkMeeting: params.linkMeeting,
        content: params.content,
      ),
    );
  }
}

class UpdateLessonParams {
  UpdateLessonParams({
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
