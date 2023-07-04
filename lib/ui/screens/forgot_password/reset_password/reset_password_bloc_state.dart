import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';

part 'reset_password_bloc_state.freezed.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class ResetPasswordBlocState with _$ResetPasswordBlocState {
  const factory ResetPasswordBlocState({
    required int? status,
    required String? message,
    required ErrorObject? errorObject,
    required ResetPasswordStatus blocStatus,
  }) = _ResetPasswordBlocState;

  factory ResetPasswordBlocState.initial() => const ResetPasswordBlocState(
        status: null,
        message: null,
        errorObject: null,
        blocStatus: ResetPasswordStatus.initial,
      );
}
