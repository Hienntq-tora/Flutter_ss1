import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/lesson_history_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'lesson_history_bloc_state.freezed.dart';

enum LessonHistoryStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class LessonHistoryBlocState with _$LessonHistoryBlocState {
  const factory LessonHistoryBlocState({
    required List<LessonHistoryOutput> output,
    required ErrorObject? errorObject,
    required LessonHistoryStatus status,
  }) = _LessonHistoryBlocState;

  factory LessonHistoryBlocState.initial() => const LessonHistoryBlocState(
        output: <LessonHistoryOutput>[],
        errorObject: null,
        status: LessonHistoryStatus.initial,
      );
}
