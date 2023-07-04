import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class None {}

class TutorLessonUseCase extends UseCase<List<Lesson>, None> {
  final AppRepository repository;

  const TutorLessonUseCase(this.repository);

  @override
  Future<List<Lesson>> call(None params) async {
    return await repository.getTutorLessons();
  }
}
