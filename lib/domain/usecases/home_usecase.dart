import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/get_lessons_input.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';
import 'package:tuple/tuple.dart';

import '../entities/none.dart';
import '../repositories/app_repository.dart';

class HomeUseCase extends UseCase<
    Tuple4<List<Lesson>, List<Lesson>, List<Lesson>, List<Field>>, None> {
  final AppRepository repository;

  const HomeUseCase(this.repository);

  @override
  Future<Tuple4<List<Lesson>, List<Lesson>, List<Lesson>, List<Field>>> call(
      None? params) async {
    var popularLessons =
        repository.getLessons(const GetLessonsInput(filter: 1));
    var newLessons = repository.getLessons(const GetLessonsInput(filter: 2));
    var topRatedLessons =
        repository.getLessons(const GetLessonsInput(filter: 3));
    var fields = repository.getFields();

    final results = await Future.wait(
        [popularLessons, newLessons, topRatedLessons, fields]);

    return Tuple4(results[0] as List<Lesson>, results[1] as List<Lesson>,
        results[2] as List<Lesson>, results[3] as List<Field>);
  }
}
