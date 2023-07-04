import 'package:time_tracker/domain/entities/logout_output.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class LogoutUseCase extends UseCase<LogoutOutput, LogoutUseCaseParams> {
  final AppRepository repository;

  const LogoutUseCase(this.repository);

  @override
  Future<LogoutOutput> call(LogoutUseCaseParams params) async {
    await repository.logout();
    repository.clearToken();
    repository.clearRefreshToken();
    repository.clearFcmRefreshToken();
    repository.clearUserData();
    return LogoutOutput();
  }
}

class LogoutUseCaseParams {
  const LogoutUseCaseParams();
}
