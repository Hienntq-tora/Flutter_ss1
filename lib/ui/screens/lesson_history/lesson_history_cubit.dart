import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/lesson_history_usecase.dart';
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class LessonHistoryCubit extends Cubit<LessonHistoryBlocState>
    with ChangeNotifier {
  LessonHistoryCubit(this._lessonHistoryUseCase)
      : super(LessonHistoryBlocState.initial());

  final LessonHistoryUseCase _lessonHistoryUseCase;

  void getLessonHistory() async {
    try {
      await Future.delayed(Duration.zero);
      emit(state.copyWith(status: LessonHistoryStatus.loading));
      final response = await _lessonHistoryUseCase.call(None());
      emit(state.copyWith(
        status: LessonHistoryStatus.loadSuccess,
        output: response,
      ));
      notifyListeners();
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: LessonHistoryStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
