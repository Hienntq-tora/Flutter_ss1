import '../../data/resources/enums/user_role.dart';

class UserRoleSelection {
  UserRoleSelection({
    required this.role,
    required this.isSelected,
  });

  final UserRole role;
  bool isSelected;
}
