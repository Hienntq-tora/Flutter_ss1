class User {
  User(
    this.id,
    this.firstName,
    this.lastName,
    this.userInfo,
  );

  final String? id;
  final String? firstName;
  final String? lastName;
  final UserInfo? userInfo;

  String get fullName => "$firstName $lastName";
}

class UserInfo {
  UserInfo(this.countryFlag, this.avatarUrl, this.ratings);

  final String? countryFlag;
  final String? avatarUrl;
  final double? ratings;
}
