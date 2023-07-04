import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/delete_reservable_date_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class DeleteReservableDateUseCase implements UseCase<DefaultOutput, String> {
  DeleteReservableDateUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<DefaultOutput> call(String dateTime) async {
    return await appRepository.deleteReservableDate(
      DeleteReservableDateInput(dateTime),
    );
  }
}
