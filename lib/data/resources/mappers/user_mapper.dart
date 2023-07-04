import 'package:time_tracker/data/resources/models/user_dto.dart';
import 'package:time_tracker/domain/entities/user.dart';

extension UserDtoX on UserDto {
  User toEntity() {
    return User(
      id,
      firstName,
      lastName,
      userInfo?.toEntity(),
    );
  }
}

extension UserInfoDtoX on UserInfoDto {
  UserInfo toEntity() {
    return UserInfo(countryFlag, avatarUrl, ratings);
  }
}
