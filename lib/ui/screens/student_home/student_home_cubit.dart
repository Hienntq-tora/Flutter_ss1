import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/entities/none.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/home_usecase.dart';
import 'student_home_bloc_state.dart';

class StudentHomeCubit extends Cubit<StudentHomeBlocState> {
  StudentHomeCubit(this._homeUseCase) : super(StudentHomeBlocState.initial());

  final HomeUseCase _homeUseCase;

  bool _loginState = false;

  bool get loginState => _loginState;

  void getHomeLessons() async {
    try {
      Future.delayed(const Duration(seconds: 0));
      emit(state.copyWith(status: StudentHomeStatus.loading));
      final lessons = await _homeUseCase.call(None());
      emit(state.copyWith(
          status: StudentHomeStatus.loadSuccess,
          popularLessons: lessons.item1,
          newLessons: lessons.item2,
          topRatedLessons: lessons.item3,
          fields: lessons.item4));
      _loginState = true;
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: StudentHomeStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
