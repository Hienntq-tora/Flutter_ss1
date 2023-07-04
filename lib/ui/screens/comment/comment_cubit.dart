import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/post_comment_usecase.dart';
import 'package:time_tracker/ui/screens/comment/comment_bloc_state.dart';

class PostCommentCubit extends Cubit<PostCommentBlocState> with ChangeNotifier {
  PostCommentCubit(
    this._postCommentUseCase,
  ) : super(PostCommentBlocState.initial());

  final PostCommentUseCase _postCommentUseCase;
  void postComment(String bookingId, String content, double rating) async {
    try {
      emit(state.copyWith(status: PostCommentStatus.loading));
      final output = await _postCommentUseCase.call(
        PostCommentUseCaseParams(
          bookingId: bookingId,
          content: content,
          rating: rating,
        ),
      );
      emit(state.copyWith(
        output: output,
        status: PostCommentStatus.loadSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: PostCommentStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
