import 'package:time_tracker/data/resources/models/comment_request.dart';
import 'package:time_tracker/domain/entities/post_comment_input.dart';

extension PostCommentInputX on PostCommentInput {
  CommentRequest toDto() {
    return CommentRequest(bookingId, content, rating);
  }
}
