import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/field.dart';
import '../../../core/error_handling/error_object.dart';
import '../../../domain/entities/lesson.dart';

part 'update_lesson_bloc_state.freezed.dart';

enum UpdateLessonStatus {
  initial,
  loading,
  loadFieldListSuccess,
  loadLessonSuccess,
  updateLessonSuccess,
  loadFailure,
}

@freezed
class UpdateLessonBlocState with _$UpdateLessonBlocState {
  const factory UpdateLessonBlocState({
    required UpdateLessonStatus status,
    required List<Field>? fields,
    required Lesson? lesson,
    required CloudinaryResponse? cloudinary,
    required DefaultOutput? updateLessonResponse,
    required ErrorObject? errorObject,
  }) = _UpdateLessonBlocState;

  factory UpdateLessonBlocState.initial() => const UpdateLessonBlocState(
        status: UpdateLessonStatus.initial,
        fields: null,
        lesson: null,
        cloudinary: null,
        updateLessonResponse: null,
        errorObject: null,
      );
}
