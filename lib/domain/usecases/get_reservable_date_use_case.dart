import 'package:time_tracker/domain/entities/get_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class GetReservableDateUseCase
    implements UseCase<List<ReservableDate>, GetReservableDateParams> {
  GetReservableDateUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<List<ReservableDate>> call(GetReservableDateParams params) {
    return repository.getReservableDate(
      GetReservableDateInput(params.tutorId),
    );
  }
}

class GetReservableDateParams {
  final String tutorId;

  GetReservableDateParams(this.tutorId);
}
