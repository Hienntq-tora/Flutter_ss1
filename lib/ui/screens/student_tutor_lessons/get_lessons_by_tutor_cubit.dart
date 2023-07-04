import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/get_lessons_by_tutor_usecase.dart';
import 'package:time_tracker/ui/screens/student_tutor_lessons/get_lessons_by_tutor_bloc_state.dart';

class GetLessonsByTutorCubit extends Cubit<GetLessonsByTutorBlocState> {
  final GetLessonsByTutorUseCase _getLessonsByTutorUseCase;

  GetLessonsByTutorCubit(
    this._getLessonsByTutorUseCase,
  ) : super(GetLessonsByTutorBlocState.initial());

  void getLessons({required String tutorId}) async {
    try {
      emit(state.copyWith(status: GetLessonsByTutorStatus.loading));
      final lessonList = await _getLessonsByTutorUseCase
          .call(GetLessonsByTutorParams(tutorId));
      emit(
        state.copyWith(
          status: GetLessonsByTutorStatus.loadSuccess,
          lessonList: lessonList,
        ),
      );
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: GetLessonsByTutorStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
