import 'package:time_tracker/data/resources/models/create_booking_request.dart';
import 'package:time_tracker/data/resources/models/create_booking_response.dart';
import 'package:time_tracker/domain/entities/create_booking_input.dart';
import 'package:time_tracker/domain/entities/create_booking_output.dart';

extension CreateBookingResponseX on CreateBookingResponse {
  CreateBookingOutput toEntity() {
    return CreateBookingOutput(payment);
  }
}

extension CreateBookingRequestX on CreateBookingInput {
  CreateBookingRequest toDto() {
    return CreateBookingRequest(lessonId, reservableDateId);
  }
}
