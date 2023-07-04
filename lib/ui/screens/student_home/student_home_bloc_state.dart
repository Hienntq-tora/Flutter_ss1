import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/field.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/entities/lesson.dart';

part 'student_home_bloc_state.freezed.dart';

enum StudentHomeStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class StudentHomeBlocState with _$StudentHomeBlocState {
  const factory StudentHomeBlocState({
    required List<Lesson> popularLessons,
    required List<Lesson> newLessons,
    required List<Lesson> topRatedLessons,
    required List<Field> fields,
    required ErrorObject? errorObject,
    required StudentHomeStatus status,
  }) = _StudentHomeBlocState;

  factory StudentHomeBlocState.initial() => const StudentHomeBlocState(
        popularLessons: [],
        newLessons: [],
        topRatedLessons: [],
        fields: [],
        errorObject: null,
        status: StudentHomeStatus.initial,
      );
}
