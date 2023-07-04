import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/register_fcm_token_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class RegisterFcmTokenUseCase
    extends UseCase<DefaultOutput, RegisterFcmTokenUseCaseParams> {
  final AppRepository repository;

  const RegisterFcmTokenUseCase(this.repository);

  @override
  Future<DefaultOutput> call(RegisterFcmTokenUseCaseParams params) async {
    return await repository.registerFcmToken(
      RegisterFcmTokenInput(token: params.token),
    );
  }
}

class RegisterFcmTokenUseCaseParams {
  const RegisterFcmTokenUseCaseParams({
    required this.token,
  });

  final String token;
}
