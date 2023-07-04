class TutorAppointmentInput {
  TutorAppointmentInput({
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

class TutorCancelAppointmentInput {
  TutorCancelAppointmentInput(
    this.cancelReason,
    this.appointmentId,
    this.isCancel,
  );

  final String cancelReason;
  final bool isCancel;
  final String appointmentId;
}
