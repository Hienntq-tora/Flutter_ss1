import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/tutor_notification.dart';

import '../../../core/error_handling/error_object.dart';

part 'tutor_notification_bloc_state.freezed.dart';

enum TutorNotificationStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class TutorNotificationBlocState with _$TutorNotificationBlocState {
  const factory TutorNotificationBlocState({
    required List<TutorNotification>? data,
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required TutorNotificationStatus tutorNotificationStatus,
  }) = _TutorNotificationBlocState;

  factory TutorNotificationBlocState.initial() =>
      const TutorNotificationBlocState(
        data: null,
        output: null,
        errorObject: null,
        tutorNotificationStatus: TutorNotificationStatus.initial,
      );
}
