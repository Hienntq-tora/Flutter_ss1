import 'package:time_tracker/domain/entities/get_schedule_list_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';
import '../entities/reservable_date.dart';

class GetScheduleListUseCase implements UseCase<List<ReservableDate>, String> {
  GetScheduleListUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<List<ReservableDate>> call(String dateTime) async {
    return await appRepository.getScheduleList(GetScheduleListInput(dateTime));
  }
}
