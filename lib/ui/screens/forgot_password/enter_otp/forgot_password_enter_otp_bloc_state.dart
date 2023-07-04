import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';

part 'forgot_password_enter_otp_bloc_state.freezed.dart';

enum ForgotPasswordEnterOtpStatus {
  initial,
  loading,
  resendOtpSuccess,
  verifyOtpSuccess,
  invalidOtp,
  failure,
}

@freezed
class ForgotPasswordEnterOtpBlocState with _$ForgotPasswordEnterOtpBlocState {
  const factory ForgotPasswordEnterOtpBlocState({
    required int? status,
    required String? message,
    required ErrorObject? errorObject,
    required ForgotPasswordEnterOtpStatus enterOtpStatus,
  }) = _ForgotPasswordEnterOtpBlocState;

  factory ForgotPasswordEnterOtpBlocState.initial() =>
      const ForgotPasswordEnterOtpBlocState(
        status: null,
        message: null,
        errorObject: null,
        enterOtpStatus: ForgotPasswordEnterOtpStatus.initial,
      );
}
