import 'package:time_tracker/data/resources/models/register_info_request.dart';
import 'package:time_tracker/data/resources/models/register_info_response.dart';
import 'package:time_tracker/domain/entities/register_info_input.dart';
import 'package:time_tracker/domain/entities/register_info_output.dart';

extension RegisterInfoResponseX on RegisterInfoResponse {
  RegisterInfoOutput toEntity() {
    return RegisterInfoOutput(
      firstName,
      lastName,
      email,
      avatarUrl,
    );
  }
}

extension RegisterInfoRequestX on RegisterInfoInput {
  RegisterInfoRequest toDto() {
    return RegisterInfoRequest(
      email,
      password,
      firstName,
      lastName,
      role,
      avatar,
    );
  }
}
