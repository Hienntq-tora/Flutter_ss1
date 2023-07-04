import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/entities/update_reservable_date_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class UpdateReservableDateUseCase
    implements UseCase<List<ReservableDate>, UpdateReservableDateParams> {
  UpdateReservableDateUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<List<ReservableDate>> call(UpdateReservableDateParams params) async {
    return await appRepository.updateReservableDate(
      UpdateReservableDateInput(params.dateTime, params.timeIds),
    );
  }
}

class UpdateReservableDateParams {
  final String dateTime;
  final List<int> timeIds;

  UpdateReservableDateParams(this.dateTime, this.timeIds);
}
