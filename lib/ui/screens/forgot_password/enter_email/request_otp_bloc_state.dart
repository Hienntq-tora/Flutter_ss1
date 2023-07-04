import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';

part 'request_otp_bloc_state.freezed.dart';

enum RequestOtpStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  invalidData
}

@freezed
class RequestOtpBlocState with _$RequestOtpBlocState {
  const factory RequestOtpBlocState({
    required int? status,
    required String? message,
    required ErrorObject? errorObject,
    required RequestOtpStatus requestOtpStatus,
  }) = _RequestOtpBlocState;

  factory RequestOtpBlocState.initial() => const RequestOtpBlocState(
        status: null,
        message: null,
        errorObject: null,
        requestOtpStatus: RequestOtpStatus.initial,
      );
}
