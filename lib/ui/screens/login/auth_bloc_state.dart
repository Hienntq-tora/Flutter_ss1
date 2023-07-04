import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/error_handling/error_object.dart';

part 'auth_bloc_state.freezed.dart';

enum AuthStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  logout,
}

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState({
    required String emailAddress,
    required String password,
    required ErrorObject? errorObject,
    required AuthStatus loginStatus,
  }) = _AuthBlocState;

  factory AuthBlocState.initial() => const AuthBlocState(
        emailAddress: '',
        password: '',
        errorObject: null,
        loginStatus: AuthStatus.initial,
      );
}
