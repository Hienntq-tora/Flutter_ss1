import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/entities/lesson_detail_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class LessonDetailUseCase implements UseCase<Lesson, String> {
  LessonDetailUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Lesson> call(String lessonId) async {
    return await appRepository.lessonDetail(LessonDetailInput(lessonId));
  }
}
