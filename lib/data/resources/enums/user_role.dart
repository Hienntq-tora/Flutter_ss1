import 'package:easy_localization/easy_localization.dart';
import 'package:time_tracker/configs/image_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';

enum UserRole { admin, tutor, student }

extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.admin:
        return LocaleKeys.userRole1.tr();
      case UserRole.tutor:
        return LocaleKeys.userRole2.tr();
      case UserRole.student:
        return LocaleKeys.userRole3.tr();
    }
  }

  int get code {
    switch (this) {
      case UserRole.admin:
        return 1;
      case UserRole.tutor:
        return 2;
      case UserRole.student:
        return 3;
    }
  }

  String? get imageAsset {
    switch (this) {
      case UserRole.tutor:
        return UiImage.tutor;
      case UserRole.student:
        return UiImage.student;
      default:
        return null;
    }
  }
}
