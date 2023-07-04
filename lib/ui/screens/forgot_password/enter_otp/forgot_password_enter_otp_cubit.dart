import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/base/errors/invalid_data_error.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/enums/enter_otp_type.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/resend_verify_otp_usecase.dart';
import 'package:time_tracker/domain/usecases/verify_otp_use_case.dart';

import 'forgot_password_enter_otp_bloc_state.dart';

class ForgotPasswordEnterOtpCubit extends Cubit<ForgotPasswordEnterOtpBlocState>
    with ChangeNotifier {
  final ResendVerifyOtpUseCase _resendVerifyOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  ForgotPasswordEnterOtpCubit(
      this._resendVerifyOtpUseCase, this._verifyOtpUseCase)
      : super(ForgotPasswordEnterOtpBlocState.initial());

  void resendVerifyOtp(
      {required String email, required EnterOtpType type}) async {
    try {
      emit(
          state.copyWith(enterOtpStatus: ForgotPasswordEnterOtpStatus.loading));
      final response = await _resendVerifyOtpUseCase.call(
        ResendVerifyOtpParams(email, type),
      );
      emit(state.copyWith(
        enterOtpStatus: ForgotPasswordEnterOtpStatus.resendOtpSuccess,
        status: response.status,
        message: response.message,
      ));
      notifyListeners();
    } on DomainError catch (e) {
      emit(state.copyWith(
          enterOtpStatus: ForgotPasswordEnterOtpStatus.failure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void verifyOtp({
    required String email,
    required String otp,
    required EnterOtpType type,
  }) async {
    try {
      emit(
          state.copyWith(enterOtpStatus: ForgotPasswordEnterOtpStatus.loading));
      final response = await _verifyOtpUseCase.call(
        VerifyOtpParams(email, otp, type),
      );
      emit(state.copyWith(
        enterOtpStatus: ForgotPasswordEnterOtpStatus.verifyOtpSuccess,
        status: response.status,
        message: response.message,
      ));
      notifyListeners();
    } on DomainError catch (e) {
      final ForgotPasswordEnterOtpStatus status =
          (e.runtimeType == InvalidDataError)
              ? ForgotPasswordEnterOtpStatus.invalidOtp
              : ForgotPasswordEnterOtpStatus.failure;
      emit(state.copyWith(
          enterOtpStatus: status,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
