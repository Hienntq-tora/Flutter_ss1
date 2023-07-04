import 'package:time_tracker/domain/entities/lesson_history_output.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class None {}

class LessonHistoryUseCase extends UseCase<List<LessonHistoryOutput>, None> {
  final AppRepository appRepository;

  LessonHistoryUseCase(this.appRepository);

  @override
  Future<List<LessonHistoryOutput>> call(None params) async {
    return await appRepository.getLessonHistory();
  }
}
