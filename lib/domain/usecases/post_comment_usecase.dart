import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/post_comment_input.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

import '../repositories/app_repository.dart';

class PostCommentUseCase
    extends UseCase<DefaultOutput, PostCommentUseCaseParams> {
  final AppRepository repository;

  const PostCommentUseCase(this.repository);

  @override
  Future<DefaultOutput> call(PostCommentUseCaseParams params) async {
    var result = await repository.postCommentLesson(PostCommentInput(
        bookingId: params.bookingId,
        content: params.content,
        rating: params.rating));
    return result;
  }
}

class PostCommentUseCaseParams {
  String bookingId;
  String content;
  double rating;
  PostCommentUseCaseParams({
    required this.bookingId,
    required this.content,
    required this.rating,
  });
}
