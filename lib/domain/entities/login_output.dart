import 'package:time_tracker/data/resources/enums/user_role.dart';

class LoginOutput {
  const LoginOutput({
    required this.id,
    required this.token,
    required this.refreshToken,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.email,
    required this.role,
  });

  final String id;
  final String token;
  final String refreshToken;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;
  final String? email;
  final UserRole role;
}
