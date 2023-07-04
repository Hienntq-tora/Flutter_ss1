import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/entities/tutor_appointment.dart';
import '../../../core/error_handling/error_object.dart';

part 'tutor_home_bloc_state.freezed.dart';

enum TutorHomeStatus {
  initial,
  loading,
  loadListsSuccess,
  cancelAppointmentSuccess,
  loadFailure,
  reload,
}

@freezed
class TutorHomeBlocState with _$TutorHomeBlocState {
  const factory TutorHomeBlocState({
    required TutorHomeStatus status,
    required List<TutorAppointment>? appointments,
    required List<ReservableDate>? reservableDates,
    required ErrorObject? errorObject,
  }) = _TutorHomeBlocState;

  factory TutorHomeBlocState.initial() => const TutorHomeBlocState(
        status: TutorHomeStatus.initial,
        appointments: null,
        reservableDates: null,
        errorObject: null,
      );
}
