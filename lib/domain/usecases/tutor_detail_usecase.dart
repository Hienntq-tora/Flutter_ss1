import 'package:time_tracker/domain/entities/tutor.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../entities/tutor_detail_input.dart';
import '../repositories/app_repository.dart';

class TutorDetailUseCase extends UseCase<Tutor, TutorDetailUseCaseParams> {
  final AppRepository repository;

  const TutorDetailUseCase(this.repository);

  @override
  Future<Tutor> call(TutorDetailUseCaseParams params) async {
    var tutor =
        await repository.getTutorDetail(GetTutorDetailInput(id: params.id));

    return tutor;
  }
}

class TutorDetailUseCaseParams {
  const TutorDetailUseCaseParams({required this.id});

  final String id;
}
