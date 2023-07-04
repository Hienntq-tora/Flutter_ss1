import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/delete_tutor_leson_input.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class DeleteTutorLessonUseCase
    implements UseCase<DefaultOutput, DeleteInfoParams> {
  final AppRepository repository;

  const DeleteTutorLessonUseCase(this.repository);

  @override
  Future<DefaultOutput> call(DeleteInfoParams params) async {
    return await repository
        .deleteTutorLessons(DeleteTutorLessonInput(params.lessonId));
  }
}

class DeleteInfoParams {
  DeleteInfoParams(
    this.lessonId,
  );

  final String lessonId;
}
