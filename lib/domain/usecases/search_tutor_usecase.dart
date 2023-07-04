import 'package:time_tracker/domain/entities/get_tutors_input.dart';
import 'package:time_tracker/domain/entities/tutor.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class SearchTutorUseCase
    extends UseCase<List<Tutor>, SearchTutorUseCaseParams> {
  final AppRepository repository;

  const SearchTutorUseCase(this.repository);

  @override
  Future<List<Tutor>> call(SearchTutorUseCaseParams? params) async {
    var tutor =
        await repository.getTutors(GetTutorsInput(search: params?.search));

    return tutor;
  }
}

class SearchTutorUseCaseParams {
  final String? search;
  const SearchTutorUseCaseParams(this.search);
}
