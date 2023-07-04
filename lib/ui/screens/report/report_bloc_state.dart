import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'report_bloc_state.freezed.dart';

enum PostReportStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class PostReportBlocState with _$PostReportBlocState {
  const factory PostReportBlocState({
    required DefaultOutput? output,
    required ErrorObject? errorObject,
    required PostReportStatus status,
  }) = _PostReportBlocState;

  factory PostReportBlocState.initial() => const PostReportBlocState(
        output: null,
        errorObject: null,
        status: PostReportStatus.initial,
      );
}
