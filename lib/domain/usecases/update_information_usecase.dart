import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/update_information_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class UpdateInformationUseCase
    implements UseCase<DefaultOutput, UpdateInfoParams> {
  UpdateInformationUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<DefaultOutput> call(UpdateInfoParams params) async {
    var output = await repository.updateInformation(UpdateInformationInput(
      params.firstName,
      params.lastName,
      params.avatarUrl,
    ));

    final userData = repository.getUserData();
    if (params.avatarUrl != null) {
      repository.setUserData(userData.copyWith(
        firstName: params.firstName,
        lastName: params.lastName,
        avatarUrl: params.avatarUrl,
      ));
    } else {
      repository.setUserData(userData.copyWith(
        firstName: params.firstName,
        lastName: params.lastName,
      ));
    }

    return output;
  }
}

class UpdateInfoParams {
  UpdateInfoParams({
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
  });

  final String firstName;
  final String lastName;
  String? avatarUrl;
}
