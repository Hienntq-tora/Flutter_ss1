import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/tutor_appointments_input.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';
import '../repositories/app_repository.dart';

class TutorCancelAppointmentUseCase
    implements UseCase<DefaultOutput, TutorCancelAppoinmentParams> {
  TutorCancelAppointmentUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<DefaultOutput> call(TutorCancelAppoinmentParams params) async {
    return await appRepository.tutorCancelAppointment(
      TutorCancelAppointmentInput(
        params.cancelReason,
        params.appointmentId,
        params.isCancel,
      ),
    );
  }
}

class TutorCancelAppoinmentParams {
  TutorCancelAppoinmentParams(
    this.appointmentId,
    this.cancelReason,
    this.isCancel,
  );

  final String appointmentId;
  final String cancelReason;
  final bool isCancel;
}
