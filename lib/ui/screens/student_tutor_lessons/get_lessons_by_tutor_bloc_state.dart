import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import '../../../core/error_handling/error_object.dart';

part 'get_lessons_by_tutor_bloc_state.freezed.dart';

enum GetLessonsByTutorStatus {
  initial,
  loading,
  loadFailure,
  loadSuccess,
}

@freezed
class GetLessonsByTutorBlocState with _$GetLessonsByTutorBlocState {
  const factory GetLessonsByTutorBlocState({
    required final List<Lesson>? lessonList,
    required ErrorObject? errorObject,
    required GetLessonsByTutorStatus status,
  }) = _GetLessonsByTutorBlocState;

  factory GetLessonsByTutorBlocState.initial() =>
      const GetLessonsByTutorBlocState(
        lessonList: null,
        errorObject: null,
        status: GetLessonsByTutorStatus.initial,
      );
}
