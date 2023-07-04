import 'package:time_tracker/domain/entities/register_info_input.dart';
import 'package:time_tracker/domain/entities/register_info_output.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class RegisterInfoUseCase
    extends UseCase<RegisterInfoOutput, RegisterInfoUseCaseParams> {
  final AppRepository repository;

  RegisterInfoUseCase(this.repository);

  @override
  Future<RegisterInfoOutput> call(RegisterInfoUseCaseParams params) async {
    return await repository.registerInfo(
      RegisterInfoInput(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        role: params.role,
        avatar: params.avatar,
      ),
    );
  }
}

class RegisterInfoUseCaseParams {
  const RegisterInfoUseCaseParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? avatar;
  final int role;
}
