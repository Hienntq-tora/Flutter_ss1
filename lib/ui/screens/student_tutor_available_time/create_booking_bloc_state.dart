import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/create_booking_output.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';

import '../../../core/error_handling/error_object.dart';

part 'create_booking_bloc_state.freezed.dart';

enum CreateBookingStatus {
  initial,
  loading,
  loadFailure,
  loadReservableDateListSuccess,
  createBookingSuccess,
}

@freezed
class CreateBookingBlocState with _$CreateBookingBlocState {
  const factory CreateBookingBlocState({
    required final List<ReservableDate>? reservableDateList,
    required final CreateBookingOutput? createBookingOutput,
    required ErrorObject? errorObject,
    required CreateBookingStatus status,
  }) = _CreateBookingBlocState;

  factory CreateBookingBlocState.initial() => const CreateBookingBlocState(
        reservableDateList: null,
        createBookingOutput: null,
        errorObject: null,
        status: CreateBookingStatus.initial,
      );
}
