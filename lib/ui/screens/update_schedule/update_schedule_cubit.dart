import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/delete_reservable_date_use_case.dart';
import 'package:time_tracker/domain/usecases/get_schedule_list_use_case.dart';
import 'package:time_tracker/domain/usecases/update_reservable_date_use_case.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_bloc_state.dart';
import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class UpdateScheduleCubit extends Cubit<UpdateScheduleBlocState> {
  UpdateScheduleCubit(
    this._getScheduleListUseCase,
    this._updateReservableDateUseCase,
    this._deleteReservableDatetUseCase,
  ) : super(UpdateScheduleBlocState.initial());

  final GetScheduleListUseCase _getScheduleListUseCase;
  final UpdateReservableDateUseCase _updateReservableDateUseCase;
  final DeleteReservableDateUseCase _deleteReservableDatetUseCase;

  void getScheduleList(String dateTime) async {
    try {
      emit(state.copyWith(status: UpdateScheduleStatus.loading));
      final reservableDates = await _getScheduleListUseCase.call(dateTime);
      emit(state.copyWith(
        status: UpdateScheduleStatus.loadSuccess,
        reservableDates: reservableDates,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: UpdateScheduleStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void updateReservableDate({
    required String dateTime,
    required List<int> timeIds,
  }) async {
    try {
      emit(state.copyWith(status: UpdateScheduleStatus.loading));
      final reservableDates = await _updateReservableDateUseCase
          .call(UpdateReservableDateParams(dateTime, timeIds));
      emit(state.copyWith(
        status: UpdateScheduleStatus.updateSuccess,
        reservableDates: reservableDates,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: UpdateScheduleStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void deleteReservableDate(String dateTime) async {
    try {
      emit(state.copyWith(status: UpdateScheduleStatus.loading));
      await _deleteReservableDatetUseCase.call(dateTime);
      emit(state.copyWith(
        status: UpdateScheduleStatus.deleteSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: UpdateScheduleStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
