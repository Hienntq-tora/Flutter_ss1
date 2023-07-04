import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/change_password_use_case.dart';
import 'change_password_bloc_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordBlocState> {
  ChangePasswordCubit(this._changePassswordUseCase)
      : super(ChangePasswordBlocState.initial());

  final ChangePasswordUseCase _changePassswordUseCase;

  void changePassword({
    required String email,
    required String oldPassword,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: ChangePasswordStatus.loading));
      final response = await _changePassswordUseCase.call(ChangePasswordParams(
          email: email, oldPassword: oldPassword, password: password));
      emit(state.copyWith(
        output: response,
        status: ChangePasswordStatus.loadSuccess,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: ChangePasswordStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
