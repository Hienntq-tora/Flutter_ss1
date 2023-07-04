import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/delete_tutor_lesson_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_lesson_usecase.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class TutorLessonCubit extends Cubit<TutorLessonBlocState> {
  TutorLessonCubit(this._tutorLessonUseCase, this._deleteTutorLessonUseCase)
      : super(TutorLessonBlocState.initial());

  final TutorLessonUseCase _tutorLessonUseCase;
  final DeleteTutorLessonUseCase _deleteTutorLessonUseCase;

  void getTutorLesson() async {
    try {
      await Future.delayed(Duration.zero);
      emit(state.copyWith(tutorLessonStatus: TutorLessonStatus.loading));
      final results = await _tutorLessonUseCase.call(None());
      emit(state.copyWith(
        tutorLessonStatus: TutorLessonStatus.loadSuccess,
        data: results,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          tutorLessonStatus: TutorLessonStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  Future<bool> deleteLesson(String lessonId) async {
    try {
      emit(state.copyWith(tutorLessonStatus: TutorLessonStatus.loading));
      final results =
          await _deleteTutorLessonUseCase.call(DeleteInfoParams(lessonId));
      emit(state.copyWith(
        tutorLessonStatus: TutorLessonStatus.deleteSuccess,
        output: results,
      ));
      return true;
    } on DomainError catch (e) {
      emit(state.copyWith(
          tutorLessonStatus: TutorLessonStatus.deleteFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
      return false;
    }
  }
}
