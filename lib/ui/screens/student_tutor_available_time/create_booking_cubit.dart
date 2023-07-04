import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/create_booking_use_case.dart';
import 'package:time_tracker/domain/usecases/get_reservable_date_use_case.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/create_booking_bloc_state.dart';

class CreateBookingCubit extends Cubit<CreateBookingBlocState> {
  final GetReservableDateUseCase _getReservableDateUseCase;
  final CreateBookingUseCase _createBookingUseCase;

  CreateBookingCubit(
    this._getReservableDateUseCase,
    this._createBookingUseCase,
  ) : super(CreateBookingBlocState.initial());

  void getReservableDates({required String tutorId}) async {
    try {
      emit(state.copyWith(status: CreateBookingStatus.loading));
      final reservableDateList = await _getReservableDateUseCase
          .call(GetReservableDateParams(tutorId));
      emit(
        state.copyWith(
          status: CreateBookingStatus.loadReservableDateListSuccess,
          reservableDateList: reservableDateList,
        ),
      );
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: CreateBookingStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void createBooking(
      {required String lessonId, required String reservableDateId}) async {
    try {
      emit(state.copyWith(status: CreateBookingStatus.loading));
      final output = await _createBookingUseCase
          .call(CreateBookingParams(lessonId, reservableDateId));
      emit(
        state.copyWith(
          status: CreateBookingStatus.createBookingSuccess,
          createBookingOutput: output,
        ),
      );
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: CreateBookingStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
