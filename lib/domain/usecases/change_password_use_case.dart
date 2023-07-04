import 'package:time_tracker/domain/entities/change_password_input.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class ChangePasswordUseCase
    implements UseCase<DefaultOutput, ChangePasswordParams> {
  ChangePasswordUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<DefaultOutput> call(ChangePasswordParams params) async {
    return await repository.changePassword(
        ChangePasswordInput(params.email, params.oldPassword, params.password));
  }
}

class ChangePasswordParams {
  ChangePasswordParams({
    required this.email,
    required this.oldPassword,
    required this.password,
  });

  final String email;
  final String oldPassword;
  final String password;
}
