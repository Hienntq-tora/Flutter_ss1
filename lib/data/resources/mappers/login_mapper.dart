import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/data/resources/models/login_request.dart';
import 'package:time_tracker/data/resources/models/login_response.dart';
import 'package:time_tracker/domain/entities/local_user_data.dart';
import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';

extension LoginResponseX on LoginResponse {
  LoginOutput toEntity() {
    return LoginOutput(
      id: id,
      refreshToken: refreshToken,
      token: token,
      firstName: firstName,
      lastName: lastName,
      avatarUrl: avatarUrl,
      email: email,
      role: role.toEntity(),
    );
  }
}

extension LoginOutputX on LoginOutput {
  LocalUserData toLocalData() {
    return LocalUserData(
      id: id,
      firstName: "$firstName",
      lastName: "$lastName",
      avatarUrl: "$avatarUrl",
      email: "$email",
      userRole: role.code,
    );
  }
}

extension LoginRequestX on LoginInput {
  LoginRequest toDto() {
    return LoginRequest(email, password, fcmRefreshToken);
  }
}

extension UserRoleDtoX on UserRoleDto {
  UserRole toEntity() {
    switch (this) {
      case UserRoleDto.admin:
        return UserRole.admin;
      case UserRoleDto.tutor:
        return UserRole.tutor;
      case UserRoleDto.student:
        return UserRole.student;
    }
  }
}
