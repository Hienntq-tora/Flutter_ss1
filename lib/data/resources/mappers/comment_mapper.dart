import 'package:time_tracker/domain/entities/comment.dart';

import '../models/comment_dto.dart';

extension CommentDtoX on CommentDto {
  Comment toEntity() {
    return Comment(
        id, fullName, email, avatar, content, rating, createdAt);
  }
}
