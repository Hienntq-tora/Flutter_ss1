import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/post_report_usecase.dart';
import 'package:time_tracker/ui/screens/report/report_bloc_state.dart';

class PostReportCubit extends Cubit<PostReportBlocState> with ChangeNotifier {
  PostReportCubit(
    this._postReportUsecase,
  ) : super(PostReportBlocState.initial());

  final PostReportUsecase _postReportUsecase;

  void postReport(
      String? lessonId, String reportType, String? description) async {
    try {
      emit(state.copyWith(status: PostReportStatus.loading));
      final output = await _postReportUsecase.call(PostReportUseCaseParams(
        lessonId: lessonId,
        reportType: reportType,
        description: description,
      ));
      emit(state.copyWith(
        output: output,
        status: PostReportStatus.loadSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: PostReportStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
