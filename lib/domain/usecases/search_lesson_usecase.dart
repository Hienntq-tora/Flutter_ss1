import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/get_lessons_input.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';
import 'package:tuple/tuple.dart';

import '../repositories/app_repository.dart';

class SearchLessonUseCase
    extends UseCase<Tuple2<List<Lesson>, List<Field>>, LessonUseCaseParams> {
  final AppRepository repository;

  const SearchLessonUseCase(this.repository);

  @override
  Future<Tuple2<List<Lesson>, List<Field>>> call(
      LessonUseCaseParams? params) async {
    var fields = repository.getFields();
    var lessons = repository.getLessons(GetLessonsInput(
        tutorId: params?.teacherId,
        search: params?.search,
        filter: params?.filter,
        fieldId: params?.fieldId,
        difficult: params?.difficult));
    final results = await Future.wait([lessons, fields]);
    return Tuple2(results[0] as List<Lesson>, results[1] as List<Field>);
  }
}

class LessonUseCaseParams {
  final String? teacherId;
  final String? search;
  final int? filter;
  final String? fieldId;
  final String? order;
  final String? difficult;

  const LessonUseCaseParams(this.teacherId, this.search, this.filter,
      this.fieldId, this.order, this.difficult);
}
