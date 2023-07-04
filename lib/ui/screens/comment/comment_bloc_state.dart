import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'comment_bloc_state.freezed.dart';

enum PostCommentStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class PostCommentBlocState with _$PostCommentBlocState {
  const factory PostCommentBlocState({
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required PostCommentStatus status,
  }) = _PostCommentBlocState;

  factory PostCommentBlocState.initial() => const PostCommentBlocState(
        output: null,
        errorObject: null,
        status: PostCommentStatus.initial,
      );
}
