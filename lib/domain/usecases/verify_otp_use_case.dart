import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/verify_otp_input.dart';
import 'package:time_tracker/domain/enums/enter_otp_type.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class VerifyOtpUseCase extends UseCase<DefaultOutput, VerifyOtpParams> {
  final AppRepository repository;

  VerifyOtpUseCase(this.repository);

  @override
  Future<DefaultOutput> call(VerifyOtpParams params) async {
    return repository.verifyOtp(VerifyOtpInput(
      email: params.email,
      otp: params.otp,
      path: params.type.toVerifyOtpPath,
    ));
  }
}

class VerifyOtpParams {
  final String email;
  final String otp;
  final EnterOtpType type;

  VerifyOtpParams(this.email, this.otp, this.type);
}
