import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';
import '../entities/none.dart';

class ListFieldUseCase implements UseCase<List<Field>, None> {
  ListFieldUseCase(this._appRepository);

  final AppRepository _appRepository;

  @override
  Future<List<Field>> call(None params) async {
    return await _appRepository.getFields();
  }
}
