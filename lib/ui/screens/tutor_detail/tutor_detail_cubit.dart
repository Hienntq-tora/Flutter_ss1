import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/tutor_detail_usecase.dart';
import 'package:time_tracker/ui/screens/tutor_detail/tutor_detail_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class TutorDetailCubit extends Cubit<TutorDetailBlocState> {
  TutorDetailCubit(this._tutorDetailUseCase)
      : super(TutorDetailBlocState.initial());

  final TutorDetailUseCase _tutorDetailUseCase;

  void getTutorDetail(String id) async {
    try {
      Future.delayed(const Duration(seconds: 0));
      emit(
          state.copyWith(status: TutorDetailStatus.loading, errorObject: null));
      final tutor =
          await _tutorDetailUseCase.call(TutorDetailUseCaseParams(id: id));
      emit(state.copyWith(status: TutorDetailStatus.loadSuccess, tutor: tutor));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: TutorDetailStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
