import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/entities/tutor.dart';

part 'tutor_detail_bloc_state.freezed.dart';

enum TutorDetailStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class TutorDetailBlocState with _$TutorDetailBlocState {
  const factory TutorDetailBlocState({
    required TutorDetailStatus status,
    required Tutor? tutor,
    required ErrorObject? errorObject,
  }) = _TutorDetailBlocState;

  factory TutorDetailBlocState.initial() =>
      const TutorDetailBlocState(
          status: TutorDetailStatus.initial,
          tutor: null,
          errorObject: null
      );
}
