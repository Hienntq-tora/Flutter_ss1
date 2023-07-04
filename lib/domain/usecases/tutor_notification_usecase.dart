import 'package:time_tracker/domain/entities/tutor_notification.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class None {}

class TutorNotificationUseCase extends UseCase<List<TutorNotification>, None> {
  final AppRepository repository;

  const TutorNotificationUseCase(this.repository);

  @override
  Future<List<TutorNotification>> call(None params) async {
    return await repository.getTutorNotification();
  }
}
