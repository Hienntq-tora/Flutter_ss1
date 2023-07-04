import 'package:time_tracker/data/resources/models/resend_verify_otp_request.dart';
import 'package:time_tracker/data/resources/models/verify_otp_request.dart';
import 'package:time_tracker/domain/entities/resend_verify_otp_input.dart';
import 'package:time_tracker/domain/entities/verify_otp_input.dart';

import '../../../domain/entities/default_output.dart';
import '../models/response_wrapper.dart';

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

extension VerifyOtpRequestX on VerifyOtpInput {
  VerifyOtpRequest toDto() {
    return VerifyOtpRequest(email, otp);
  }
}
