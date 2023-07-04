import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/reset_password_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class ResetPasswordUseCase extends UseCase<DefaultOutput, ResetPasswordParams> {
  final AppRepository repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<DefaultOutput> call(ResetPasswordParams params) async {
    return repository
        .resetPassword(ResetPasswordInput(params.email, params.password));
  }
}

class ResetPasswordParams {
  final String email;
  final String password;

  ResetPasswordParams(this.email, this.password);
}
