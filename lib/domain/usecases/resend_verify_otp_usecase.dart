import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/resend_verify_otp_input.dart';
import 'package:time_tracker/domain/enums/enter_otp_type.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class ResendVerifyOtpUseCase
    extends UseCase<DefaultOutput, ResendVerifyOtpParams> {
  final AppRepository repository;

  ResendVerifyOtpUseCase(this.repository);

  @override
  Future<DefaultOutput> call(ResendVerifyOtpParams params) {
    return repository.resendVerifyOtp(ResendVerifyOtpInput(
      email: params.email,
      path: params.type.toResendVerifyOtpPath,
    ));
  }
}

class ResendVerifyOtpParams {
  final String email;
  final EnterOtpType type;

  ResendVerifyOtpParams(this.email, this.type);
}
