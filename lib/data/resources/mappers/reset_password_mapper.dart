import 'package:time_tracker/data/resources/models/reset_password_request.dart';
import 'package:time_tracker/domain/entities/reset_password_input.dart';

extension ResetPasswordRequestX on ResetPasswordInput {
  ResetPasswordRequest toDto() {
    return ResetPasswordRequest(email, password);
  }
}
