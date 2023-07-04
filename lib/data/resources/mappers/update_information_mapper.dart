import 'package:time_tracker/data/resources/models/update_information_request.dart';
import 'package:time_tracker/domain/entities/update_information_input.dart';

extension UpdateInformationRequestX on UpdateInformationInput {
  UpdateInformationRequest toDto() {
    return UpdateInformationRequest(firstName, lastName, avatarUrl);
  }
}
