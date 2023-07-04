import 'package:time_tracker/data/resources/mappers/lesson_mapper.dart';
import 'package:time_tracker/data/resources/mappers/reservable_date_mapper.dart';
import 'package:time_tracker/data/resources/mappers/user_mapper.dart';
import 'package:time_tracker/data/resources/models/delete_reservable_date_request.dart';
import 'package:time_tracker/data/resources/models/tutor_appointment_request.dart';
import 'package:time_tracker/data/resources/models/tutor_appointment_response.dart';
import 'package:time_tracker/data/resources/models/tutor_cancel_appointment_request.dart';
import 'package:time_tracker/domain/entities/delete_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/tutor_appointment.dart';
import '../../../domain/entities/tutor_appointments_input.dart';

extension TutorAppointmentsRequestX on TutorAppointmentInput {
  TutorAppointmentRequest toDto() {
    return TutorAppointmentRequest(
      startTime,
      endTime,
      startSlot,
      endSlot,
      status,
    );
  }
}

extension TutorCancelAppointmentRequestX on TutorCancelAppointmentInput {
  TutorCancelAppointmentRequest toDto() {
    return TutorCancelAppointmentRequest(cancelReason, isCancel);
  }
}

extension TutorAppointmentResponseX on TutorAppointmentResponse {
  TutorAppointment toEntity() {
    return TutorAppointment(
      id: id,
      isCancel: isCancel,
      student: student?.toEntity(),
      lesson: lesson?.toEntity(),
      reservableDate: reservableDate?.toEntity(),
    );
  }
}

extension DeleteReservableDateRequestX on DeleteReservableDateInput {
  DeleteReservableDateRequest toDto() {
    return DeleteReservableDateRequest(dateTime);
  }
}
