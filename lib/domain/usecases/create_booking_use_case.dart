import 'package:time_tracker/domain/entities/create_booking_input.dart';
import 'package:time_tracker/domain/entities/create_booking_output.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class CreateBookingUseCase
    implements UseCase<CreateBookingOutput, CreateBookingParams> {
  CreateBookingUseCase(this.repository);

  final AppRepository repository;

  @override
  Future<CreateBookingOutput> call(CreateBookingParams params) async {
    return await repository.createBooking(
      CreateBookingInput(params.lessonId, params.reservableDateId),
    );
  }
}

class CreateBookingParams {
  final String lessonId;
  final String reservableDateId;

  CreateBookingParams(this.lessonId, this.reservableDateId);
}
