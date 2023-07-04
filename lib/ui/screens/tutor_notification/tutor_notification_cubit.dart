import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/tutor_notification_usecase.dart';
import 'package:time_tracker/domain/usecases/read_all_notification_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_notification_usecase.dart'
    as tn;
import 'package:time_tracker/domain/usecases/read_all_notification_usecase.dart'
    as ra;
import 'package:time_tracker/ui/screens/tutor_notification/tutor_notification_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class TutorNotificationCubit extends Cubit<TutorNotificationBlocState> {
  TutorNotificationCubit(
    this._tutorNotificationUseCase,
    this._readAllNotificationUseCase,
  ) : super(TutorNotificationBlocState.initial());

  final TutorNotificationUseCase _tutorNotificationUseCase;
  final ReadAllNotificationUseCase _readAllNotificationUseCase;

  void getTutorNotification() async {
    try {
      await Future.delayed(Duration.zero);
      emit(state.copyWith(
          tutorNotificationStatus: TutorNotificationStatus.loading));
      final results = await _tutorNotificationUseCase.call(tn.None());
      emit(state.copyWith(
        tutorNotificationStatus: TutorNotificationStatus.loadSuccess,
        data: results,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          tutorNotificationStatus: TutorNotificationStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void readAllNotification() async {
    try {
      await _readAllNotificationUseCase.call(ra.None());
    } on DomainError catch (e) {
      emit(state.copyWith(
          tutorNotificationStatus: TutorNotificationStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
