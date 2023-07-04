import 'package:time_tracker/data/resources/models/resend_verify_otp_request.dart';
import 'package:time_tracker/data/resources/models/response_wrapper.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/resend_verify_otp_input.dart';

extension ResponseWrapperX on ResponseWrapper {
  DefaultOutput toEntity() {
    return DefaultOutput(status, message);
  }
}

extension ResendVerifyOtpRequestX on ResendVerifyOtpInput {
  ResendVerifyOtpRequest toDto() {
    return ResendVerifyOtpRequest(email);
  }
}
