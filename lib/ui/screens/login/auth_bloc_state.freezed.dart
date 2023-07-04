// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthBlocState {
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  AuthStatus get loginStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthBlocStateCopyWith<AuthBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBlocStateCopyWith<$Res> {
  factory $AuthBlocStateCopyWith(
          AuthBlocState value, $Res Function(AuthBlocState) then) =
      _$AuthBlocStateCopyWithImpl<$Res, AuthBlocState>;
  @useResult
  $Res call(
      {String emailAddress,
      String password,
      ErrorObject? errorObject,
      AuthStatus loginStatus});
}

/// @nodoc
class _$AuthBlocStateCopyWithImpl<$Res, $Val extends AuthBlocState>
    implements $AuthBlocStateCopyWith<$Res> {
  _$AuthBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? errorObject = freezed,
    Object? loginStatus = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthBlocStateCopyWith<$Res>
    implements $AuthBlocStateCopyWith<$Res> {
  factory _$$_AuthBlocStateCopyWith(
          _$_AuthBlocState value, $Res Function(_$_AuthBlocState) then) =
      __$$_AuthBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String emailAddress,
      String password,
      ErrorObject? errorObject,
      AuthStatus loginStatus});
}

/// @nodoc
class __$$_AuthBlocStateCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$_AuthBlocState>
    implements _$$_AuthBlocStateCopyWith<$Res> {
  __$$_AuthBlocStateCopyWithImpl(
      _$_AuthBlocState _value, $Res Function(_$_AuthBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? errorObject = freezed,
    Object? loginStatus = null,
  }) {
    return _then(_$_AuthBlocState(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$_AuthBlocState implements _AuthBlocState {
  const _$_AuthBlocState(
      {required this.emailAddress,
      required this.password,
      required this.errorObject,
      required this.loginStatus});

  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final ErrorObject? errorObject;
  @override
  final AuthStatus loginStatus;

  @override
  String toString() {
    return 'AuthBlocState(emailAddress: $emailAddress, password: $password, errorObject: $errorObject, loginStatus: $loginStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthBlocState &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, emailAddress, password, errorObject, loginStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthBlocStateCopyWith<_$_AuthBlocState> get copyWith =>
      __$$_AuthBlocStateCopyWithImpl<_$_AuthBlocState>(this, _$identity);
}

abstract class _AuthBlocState implements AuthBlocState {
  const factory _AuthBlocState(
      {required final String emailAddress,
      required final String password,
      required final ErrorObject? errorObject,
      required final AuthStatus loginStatus}) = _$_AuthBlocState;

  @override
  String get emailAddress;
  @override
  String get password;
  @override
  ErrorObject? get errorObject;
  @override
  AuthStatus get loginStatus;
  @override
  @JsonKey(ignore: true)
  _$$_AuthBlocStateCopyWith<_$_AuthBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
