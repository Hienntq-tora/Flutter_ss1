import 'package:time_tracker/data/resources/enums/end_points.dart';

enum EnterOtpType {
  createAccount,
  forgotPassword,
}

extension EnterOtpTypeX on EnterOtpType {
  String get toResendVerifyOtpPath {
    switch (this) {
      case EnterOtpType.createAccount:
        return EndPoints.createAccountResendVerifyOtp.toPath;
      case EnterOtpType.forgotPassword:
        return EndPoints.forgotPasswordResendVerifyOtp.toPath;
    }
  }

  String get toVerifyOtpPath {
    switch (this) {
      case EnterOtpType.createAccount:
        return EndPoints.createAccountVerifyOtp.toPath;
      case EnterOtpType.forgotPassword:
        return EndPoints.forgotPasswordVerifyOtp.toPath;
    }
  }
}
