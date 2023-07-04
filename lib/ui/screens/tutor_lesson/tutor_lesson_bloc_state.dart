import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/lesson.dart';

import '../../../core/error_handling/error_object.dart';

part 'tutor_lesson_bloc_state.freezed.dart';

enum TutorLessonStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  deleteSuccess,
  deleteFailure,
}

@freezed
class TutorLessonBlocState with _$TutorLessonBlocState {
  const factory TutorLessonBlocState({
    required List<Lesson>? data,
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required TutorLessonStatus tutorLessonStatus,
  }) = _TutorLessonBlocState;

  factory TutorLessonBlocState.initial() => const TutorLessonBlocState(
        data: null,
        output: null,
        errorObject: null,
        tutorLessonStatus: TutorLessonStatus.initial,
      );
}
