import 'package:time_tracker/domain/entities/tutor_feedback_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../entities/default_output.dart';

class TutorFeedbackUseCase
  implements UseCase<DefaultOutput, TutorFeedbackParams> {
  TutorFeedbackUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<DefaultOutput> call(TutorFeedbackParams params) async {
    return await repository.sendFeedback(
      TutorFeedbackInput(description: params.description),
    );
  }
}

class TutorFeedbackParams {
  String? description;
  TutorFeedbackParams({
    required this.description,
  });
}