import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';

import '../../../core/error_handling/error_object.dart';

part 'update_schedule_bloc_state.freezed.dart';

enum UpdateScheduleStatus {
  initial,
  loading,
  loadFailure,
  loadSuccess,
  updateSuccess,
  deleteSuccess,
}

@freezed
class UpdateScheduleBlocState with _$UpdateScheduleBlocState {
  const factory UpdateScheduleBlocState({
    required List<ReservableDate>? reservableDates,
    required ErrorObject? errorObject,
    required UpdateScheduleStatus status,
  }) = _UpdateScheduleBlocState;

  factory UpdateScheduleBlocState.initial() => const UpdateScheduleBlocState(
        reservableDates: null,
        errorObject: null,
        status: UpdateScheduleStatus.initial,
      );
}
