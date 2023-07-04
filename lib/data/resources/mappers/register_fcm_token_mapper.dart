import 'package:time_tracker/data/resources/models/register_fcm_token_request.dart';
import 'package:time_tracker/domain/entities/register_fcm_token_input.dart';

extension RegisterFcmTokenRequestX on RegisterFcmTokenInput {
  RegisterFcmTokenRequest toDto() {
    return RegisterFcmTokenRequest(token);
  }
}
