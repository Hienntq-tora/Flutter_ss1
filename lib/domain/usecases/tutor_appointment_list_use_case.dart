import 'package:time_tracker/domain/entities/tutor_appointment.dart';
import 'package:time_tracker/domain/entities/tutor_appointments_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class TutorAppointmentListUseCase
    implements UseCase<List<TutorAppointment>, TutorAppoinmentListParams> {
  TutorAppointmentListUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<List<TutorAppointment>> call(TutorAppoinmentListParams params) async {
    return await appRepository.tutorAppoinmentList(TutorAppointmentInput(
        startTime: params.startTime,
        endTime: params.endTime,
        startSlot: params.startSlot,
        endSlot: params.endSlot,
        status: params.status));
  }
}

class TutorAppoinmentListParams {
  TutorAppoinmentListParams({
    required this.startTime,
    required this.endTime,
    required this.startSlot,
    required this.endSlot,
    required this.status,
  });

  final String startTime;
  final String endTime;
  final String startSlot;
  final String endSlot;
  final String status;
}
