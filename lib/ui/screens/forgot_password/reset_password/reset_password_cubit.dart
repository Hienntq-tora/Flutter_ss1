import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/reset_password_usecase.dart';
import 'package:time_tracker/ui/screens/forgot_password/reset_password/reset_password_bloc_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordBlocState>
    with ChangeNotifier {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
      : super(ResetPasswordBlocState.initial());

  void resetPassword({required String email, required String password}) async {
    try {
      emit(state.copyWith(blocStatus: ResetPasswordStatus.loading));
      final output = await _resetPasswordUseCase
          .call(ResetPasswordParams(email, password));
      emit(
        state.copyWith(
          blocStatus: ResetPasswordStatus.loadSuccess,
          status: output.status,
          message: output.message,
        ),
      );
    } on DomainError catch (e) {
      emit(
        state.copyWith(
          blocStatus: ResetPasswordStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e),
        ),
      );
    }
  }
}
