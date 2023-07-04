import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/get_tutor_reservable_dates_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_appointment_list_use_case.dart';
import 'package:time_tracker/domain/usecases/tutor_cancel_appointment_usecase.dart';
import 'package:time_tracker/ui/screens/tutor_home/component/tutor_home_radio_form_field.dart';
import 'package:time_tracker/utils/util.dart';
import '../../../core/error_handling/error_object.dart';
import '../../../domain/enums/date_formats.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/delete_reservable_date_use_case.dart';
import '../filter_appointment/filter_appointment/filter_appointment_bottom_sheet.dart.dart';
import 'tutor_home_bloc_state.dart';

class TutorHomeCubit extends Cubit<TutorHomeBlocState> {
  TutorHomeCubit(
    this._tutorAppointmentListUseCase,
    this._tutorCancelAppointmentUseCase,
    this._tutorReservableDatesUseCase,
    this._deleteTutorReservableDateUseCase,
  ) : super(TutorHomeBlocState.initial());

  final TutorAppointmentListUseCase _tutorAppointmentListUseCase;
  final TutorCancelAppointmentUseCase _tutorCancelAppointmentUseCase;
  final GetTutorReservableDatesUseCase _tutorReservableDatesUseCase;
  final DeleteReservableDateUseCase _deleteTutorReservableDateUseCase;

  void getTutorHomeLists(FilterAppointmentModel filterParams) async {
    try {
      emit(state.copyWith(status: TutorHomeStatus.loading));

      final requestParams = TutorAppoinmentListParams(
        startTime:
            filterParams.startDate.parseToString(DateFormats.serverDate) ?? "",
        endTime:
            filterParams.endDate.parseToString(DateFormats.serverDate) ?? "",
        startSlot: filterParams.startTime ?? "",
        endSlot: filterParams.endTime ?? "",
        status: filterParams.bookingStatus?.code ?? "",
      );

      final appointments =
          await _tutorAppointmentListUseCase.call(requestParams);

      final reservableDates =
          await _tutorReservableDatesUseCase.call(requestParams);

      emit(state.copyWith(
        status: TutorHomeStatus.loadListsSuccess,
        appointments: appointments,
        reservableDates: reservableDates,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: TutorHomeStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void cancelAppoinment({
    required String id,
    required String cancelReason,
    required bool isCancel,
  }) async {
    try {
      emit(state.copyWith(status: TutorHomeStatus.loading));
      await _tutorCancelAppointmentUseCase
          .call(TutorCancelAppoinmentParams(id, cancelReason, isCancel));
      emit(state.copyWith(
        status: TutorHomeStatus.cancelAppointmentSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: TutorHomeStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  Future<bool> deleteReservableDate({
    required String datetime,
  }) async {
    try {
      emit(state.copyWith(status: TutorHomeStatus.loading));
      await _deleteTutorReservableDateUseCase(datetime);
      emit(state.copyWith(status: TutorHomeStatus.cancelAppointmentSuccess));
      return true;
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: TutorHomeStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
    return false;
  }

  void reload() {
    emit(state.copyWith(status: TutorHomeStatus.reload));
  }
}
