class LoginInput {
  const LoginInput({
    required this.email,
    required this.password,
    required this.fcmRefreshToken,
  });

  final String email;
  final String password;
  final String fcmRefreshToken;
}
