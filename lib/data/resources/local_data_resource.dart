import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/core/shared_preference_keys.dart';
import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/domain/entities/local_user_data.dart';

class LocalDataResource {
  const LocalDataResource(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  void setAccessToken(String token) {
    sharedPreferences.setString(SharedPreferencesKeys.token, token);
  }

  String getAccessToken() {
    return sharedPreferences.getString(SharedPreferencesKeys.token) ?? '';
  }

  void clearAccessToken() {
    sharedPreferences.remove(SharedPreferencesKeys.token);
  }

  void setRefreshToken(String refreshToken) {
    sharedPreferences.setString(
        SharedPreferencesKeys.refreshToken, refreshToken);
  }

  String getRefreshToken() {
    return sharedPreferences.getString(SharedPreferencesKeys.refreshToken) ??
        '';
  }

  void clearRefreshToken() {
    sharedPreferences.remove(SharedPreferencesKeys.refreshToken);
  }

  void setUserData(LocalUserData data) {
    sharedPreferences.setString(SharedPreferencesKeys.id, data.id);
    sharedPreferences.setString(
        SharedPreferencesKeys.firstName, data.firstName);
    sharedPreferences.setString(SharedPreferencesKeys.lastName, data.lastName);
    sharedPreferences.setString(
        SharedPreferencesKeys.avatarUrl, data.avatarUrl);
    sharedPreferences.setString(SharedPreferencesKeys.email, data.email);
    sharedPreferences.setInt(SharedPreferencesKeys.userRole, data.userRole);
  }

  LocalUserData getUserData() {
    return LocalUserData(
      id: sharedPreferences.getString(SharedPreferencesKeys.id) ?? "",
      firstName:
          sharedPreferences.getString(SharedPreferencesKeys.firstName) ?? "",
      lastName:
          sharedPreferences.getString(SharedPreferencesKeys.lastName) ?? "",
      avatarUrl:
          sharedPreferences.getString(SharedPreferencesKeys.avatarUrl) ?? "",
      email: sharedPreferences.getString(SharedPreferencesKeys.email) ?? "",
      userRole: sharedPreferences.getInt(SharedPreferencesKeys.userRole) ??
          UserRole.student.code,
    );
  }

  void clearUserData() {
    sharedPreferences.remove(SharedPreferencesKeys.id);
    sharedPreferences.remove(SharedPreferencesKeys.firstName);
    sharedPreferences.remove(SharedPreferencesKeys.lastName);
    sharedPreferences.remove(SharedPreferencesKeys.avatarUrl);
    sharedPreferences.remove(SharedPreferencesKeys.email);
    sharedPreferences.remove(SharedPreferencesKeys.userRole);
  }

  void setFcmRefreshToken(String fcmRefreshToken) {
    sharedPreferences.setString(
        SharedPreferencesKeys.fcmRefreshToken, fcmRefreshToken);
  }

  String getFcmRefreshToken() {
    return sharedPreferences.getString(SharedPreferencesKeys.fcmRefreshToken) ??
        '';
  }

  void clearFcmRefreshToken() {
    sharedPreferences.remove(SharedPreferencesKeys.fcmRefreshToken);
  }
}
