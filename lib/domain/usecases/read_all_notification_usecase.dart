import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class None {}

class ReadAllNotificationUseCase extends UseCase<DefaultOutput, None> {
  final AppRepository repository;

  const ReadAllNotificationUseCase(this.repository);

  @override
  Future<DefaultOutput> call(None params) async {
    return await repository.readAllNotification();
  }
}
