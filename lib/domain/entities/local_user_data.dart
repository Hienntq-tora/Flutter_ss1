import 'package:time_tracker/data/resources/enums/user_role.dart';

class LocalUserData {
  LocalUserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.email,
    required this.userRole,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String email;
  final int userRole;

  String get fullName => "$firstName $lastName";

  UserRole? get role {
    switch (userRole) {
      case 1:
        return UserRole.admin;
      case 2:
        return UserRole.tutor;
      case 3:
        return UserRole.student;
      default:
        return null;
    }
  }

  LocalUserData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? email,
    int? userRole,
  }) {
    return LocalUserData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      userRole: userRole ?? this.userRole,
    );
  }
}
