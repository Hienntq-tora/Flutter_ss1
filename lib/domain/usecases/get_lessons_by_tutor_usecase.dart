import 'package:time_tracker/domain/entities/get_lessons_by_tutor_input.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class GetLessonsByTutorUseCase
    implements UseCase<List<Lesson>, GetLessonsByTutorParams> {
  GetLessonsByTutorUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<List<Lesson>> call(GetLessonsByTutorParams params) async {
    return repository.getLessonsByTutor(
      GetLessonsByTutorInput(params.tutorId),
    );
  }
}

class GetLessonsByTutorParams {
  GetLessonsByTutorParams(this.tutorId);

  final String tutorId;
}
