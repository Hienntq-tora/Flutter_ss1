import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/base/errors/invalid_data_error.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/enums/enter_otp_type.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/resend_verify_otp_usecase.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_email/request_otp_bloc_state.dart';

class RequestOtpCubit extends Cubit<RequestOtpBlocState> with ChangeNotifier {
  RequestOtpCubit(this._resendVerifyOtpUseCase)
      : super(RequestOtpBlocState.initial());

  final ResendVerifyOtpUseCase _resendVerifyOtpUseCase;

  void requestOtp({required String email}) async {
    try {
      emit(state.copyWith(requestOtpStatus: RequestOtpStatus.loading));
      final output = await _resendVerifyOtpUseCase.call(
        ResendVerifyOtpParams(email, EnterOtpType.forgotPassword),
      );
      emit(state.copyWith(
        status: output.status,
        message: output.message,
        requestOtpStatus: RequestOtpStatus.loadSuccess,
      ));
      notifyListeners();
    } on DomainError catch (e) {
      switch (e.runtimeType) {
        case InvalidDataError:
          emit(state.copyWith(
              requestOtpStatus: RequestOtpStatus.invalidData,
              errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
          break;
        default:
          emit(state.copyWith(
              requestOtpStatus: RequestOtpStatus.loadFailure,
              errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
          break;
      }
    }
  }
}
