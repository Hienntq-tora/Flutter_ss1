import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/lesson.dart';

import '../../../core/error_handling/error_object.dart';

part 'search_lesson_state.freezed.dart';

enum SearchLessonStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class SearchLessonBlocState with _$SearchLessonBlocState {
  const factory SearchLessonBlocState({
    required List<Lesson>? data,
    required List<Field>? fields,
    required ErrorObject? errorObject,
    required SearchLessonStatus searchLessonStatus,
  }) = _FilterTimeTrackerBlocState;

  factory SearchLessonBlocState.initial() => const SearchLessonBlocState(
        data: null,
        fields: null,
        errorObject: null,
        searchLessonStatus: SearchLessonStatus.initial,
      );
}
