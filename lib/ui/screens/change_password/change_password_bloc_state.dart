import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'change_password_bloc_state.freezed.dart';

enum ChangePasswordStatus {
  initial,
  loading,
  loadFailure,
  loadSuccess,
}

@freezed
class ChangePasswordBlocState with _$ChangePasswordBlocState {
  const factory ChangePasswordBlocState({
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required ChangePasswordStatus status,
  }) = _ChangePasswordBlocState;

  factory ChangePasswordBlocState.initial() => const ChangePasswordBlocState(
        output: null,
        errorObject: null,
        status: ChangePasswordStatus.initial,
      );
}
