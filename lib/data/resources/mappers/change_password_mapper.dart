import 'package:time_tracker/data/resources/models/change_password_request.dart';
import 'package:time_tracker/domain/entities/change_password_input.dart';

extension ChangePasswordRequestX on ChangePasswordInput {
  ChangePasswordRequest toDto() {
    return ChangePasswordRequest(email, oldPassword, password);
  }
}
