import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/tutor_feedback_usecase.dart';
import 'package:time_tracker/ui/screens/tutor_feedback/tutor_feedback_bloc_state.dart';

class TutorFeedbackCubit extends Cubit<TutorFeedbackBlocState>
    with ChangeNotifier {
  TutorFeedbackCubit(
    this._feedbackUseCase,
  ) : super(TutorFeedbackBlocState.initial());

  final TutorFeedbackUseCase _feedbackUseCase;

  void sendFeedback(String? description) async {
    try {
      emit(state.copyWith(status: TutorFeedbackStatus.loading));
      final output = await _feedbackUseCase.call(
        TutorFeedbackParams(
          description: description,
        ),
      );
      emit(state.copyWith(
        output: output,
        status: TutorFeedbackStatus.sendFeedbackSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: TutorFeedbackStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
