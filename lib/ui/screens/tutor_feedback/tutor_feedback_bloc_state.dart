import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'tutor_feedback_bloc_state.freezed.dart';

enum TutorFeedbackStatus {
  initial,
  loading,
  sendFeedbackSuccess,
  loadFailure,
}

@freezed
class TutorFeedbackBlocState with _$TutorFeedbackBlocState {
  const factory TutorFeedbackBlocState({
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required TutorFeedbackStatus status,
  }) = _TutorFeedbackBlocState;

  factory TutorFeedbackBlocState.initial() => const TutorFeedbackBlocState(
        output: null,
        errorObject: null,
        status: TutorFeedbackStatus.initial,
      );
}
