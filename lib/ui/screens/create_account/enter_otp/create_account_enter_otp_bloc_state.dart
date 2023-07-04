import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';

part 'create_account_enter_otp_bloc_state.freezed.dart';

enum CreateAccountEnterOtpStatus {
  initial,
  loading,
  resendOtpSuccess,
  verifyOtpSuccess,
  invalidOtp,
  failure,
}

@freezed
class CreateAccountEnterOtpBlocState with _$CreateAccountEnterOtpBlocState {
  const factory CreateAccountEnterOtpBlocState({
    required int? status,
    required String? message,
    required ErrorObject? errorObject,
    required CreateAccountEnterOtpStatus enterOtpStatus,
  }) = _CreateAccountEnterOtpBlocState;

  factory CreateAccountEnterOtpBlocState.initial() =>
      const CreateAccountEnterOtpBlocState(
        status: null,
        message: null,
        errorObject: null,
        enterOtpStatus: CreateAccountEnterOtpStatus.initial,
      );
}
