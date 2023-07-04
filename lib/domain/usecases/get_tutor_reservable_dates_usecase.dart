import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/entities/tutor_appointments_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/tutor_appointment_list_use_case.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class GetTutorReservableDatesUseCase
    implements UseCase<List<ReservableDate>, TutorAppoinmentListParams> {
  GetTutorReservableDatesUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<List<ReservableDate>> call(TutorAppoinmentListParams params) {
    return repository.getTutorReservableDates(TutorAppointmentInput(
      startTime: params.startTime,
      endTime: params.endTime,
      startSlot: params.startSlot,
      endSlot: params.endSlot,
      status: params.status,
    ));
  }
}
