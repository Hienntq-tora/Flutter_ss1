import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/login_usecase.dart';
import 'package:time_tracker/domain/usecases/register_fcm_token_use_case.dart';
import 'package:time_tracker/ui/screens/login/auth_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/logout_usecase.dart';

class AuthCubit extends Cubit<AuthBlocState> with ChangeNotifier {
  AuthCubit(this._loginUseCase, this._logoutUseCase, this._appRepository,
      this._registerFcmTokenUseCase)
      : super(AuthBlocState.initial()) {
    _loginState = _appRepository.getToken().isNotEmpty;
    _userRole = _appRepository.getUserData().role;
  }

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final AppRepository _appRepository;
  final RegisterFcmTokenUseCase _registerFcmTokenUseCase;

  bool _loginState = false;
  UserRole? _userRole;

  bool get loginState => _loginState;
  UserRole? get userRole => _userRole;

  void signIn(String email, String password) async {
    try {
      emit(state.copyWith(loginStatus: AuthStatus.loading));
      final response = await _loginUseCase
          .call(LoginUseCaseParams(email: email, password: password));
      emit(state.copyWith(loginStatus: AuthStatus.loadSuccess));
      _loginState = true;
      _userRole = response.role;
      notifyListeners();
    } on DomainError catch (e) {
      emit(state.copyWith(
          loginStatus: AuthStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void signOut() async {
    try {
      emit(state.copyWith(loginStatus: AuthStatus.loading));
      await _logoutUseCase.call(const LogoutUseCaseParams());
    } on DomainError catch (_) {}
    emit(state.copyWith(loginStatus: AuthStatus.logout));
    _loginState = false;
    notifyListeners();
  }

  void registerFcmToken(String token) async {
    try {
      await _registerFcmTokenUseCase
          .call(RegisterFcmTokenUseCaseParams(token: token));
      notifyListeners();
    } on DomainError catch (e) {
      emit(state.copyWith(
          loginStatus: AuthStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
