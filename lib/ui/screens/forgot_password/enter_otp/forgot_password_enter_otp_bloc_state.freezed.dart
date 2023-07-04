// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_enter_otp_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordEnterOtpBlocState {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  ForgotPasswordEnterOtpStatus get enterOtpStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordEnterOtpBlocStateCopyWith<ForgotPasswordEnterOtpBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEnterOtpBlocStateCopyWith<$Res> {
  factory $ForgotPasswordEnterOtpBlocStateCopyWith(
          ForgotPasswordEnterOtpBlocState value,
          $Res Function(ForgotPasswordEnterOtpBlocState) then) =
      _$ForgotPasswordEnterOtpBlocStateCopyWithImpl<$Res,
          ForgotPasswordEnterOtpBlocState>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      ForgotPasswordEnterOtpStatus enterOtpStatus});
}

/// @nodoc
class _$ForgotPasswordEnterOtpBlocStateCopyWithImpl<$Res,
        $Val extends ForgotPasswordEnterOtpBlocState>
    implements $ForgotPasswordEnterOtpBlocStateCopyWith<$Res> {
  _$ForgotPasswordEnterOtpBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? errorObject = freezed,
    Object? enterOtpStatus = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      enterOtpStatus: null == enterOtpStatus
          ? _value.enterOtpStatus
          : enterOtpStatus // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordEnterOtpStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordEnterOtpBlocStateCopyWith<$Res>
    implements $ForgotPasswordEnterOtpBlocStateCopyWith<$Res> {
  factory _$$_ForgotPasswordEnterOtpBlocStateCopyWith(
          _$_ForgotPasswordEnterOtpBlocState value,
          $Res Function(_$_ForgotPasswordEnterOtpBlocState) then) =
      __$$_ForgotPasswordEnterOtpBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      ForgotPasswordEnterOtpStatus enterOtpStatus});
}

/// @nodoc
class __$$_ForgotPasswordEnterOtpBlocStateCopyWithImpl<$Res>
    extends _$ForgotPasswordEnterOtpBlocStateCopyWithImpl<$Res,
        _$_ForgotPasswordEnterOtpBlocState>
    implements _$$_ForgotPasswordEnterOtpBlocStateCopyWith<$Res> {
  __$$_ForgotPasswordEnterOtpBlocStateCopyWithImpl(
      _$_ForgotPasswordEnterOtpBlocState _value,
      $Res Function(_$_ForgotPasswordEnterOtpBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? errorObject = freezed,
    Object? enterOtpStatus = null,
  }) {
    return _then(_$_ForgotPasswordEnterOtpBlocState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      enterOtpStatus: null == enterOtpStatus
          ? _value.enterOtpStatus
          : enterOtpStatus // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordEnterOtpStatus,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordEnterOtpBlocState
    implements _ForgotPasswordEnterOtpBlocState {
  const _$_ForgotPasswordEnterOtpBlocState(
      {required this.status,
      required this.message,
      required this.errorObject,
      required this.enterOtpStatus});

  @override
  final int? status;
  @override
  final String? message;
  @override
  final ErrorObject? errorObject;
  @override
  final ForgotPasswordEnterOtpStatus enterOtpStatus;

  @override
  String toString() {
    return 'ForgotPasswordEnterOtpBlocState(status: $status, message: $message, errorObject: $errorObject, enterOtpStatus: $enterOtpStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordEnterOtpBlocState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.enterOtpStatus, enterOtpStatus) ||
                other.enterOtpStatus == enterOtpStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, errorObject, enterOtpStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordEnterOtpBlocStateCopyWith<
          _$_ForgotPasswordEnterOtpBlocState>
      get copyWith => __$$_ForgotPasswordEnterOtpBlocStateCopyWithImpl<
          _$_ForgotPasswordEnterOtpBlocState>(this, _$identity);
}

abstract class _ForgotPasswordEnterOtpBlocState
    implements ForgotPasswordEnterOtpBlocState {
  const factory _ForgotPasswordEnterOtpBlocState(
          {required final int? status,
          required final String? message,
          required final ErrorObject? errorObject,
          required final ForgotPasswordEnterOtpStatus enterOtpStatus}) =
      _$_ForgotPasswordEnterOtpBlocState;

  @override
  int? get status;
  @override
  String? get message;
  @override
  ErrorObject? get errorObject;
  @override
  ForgotPasswordEnterOtpStatus get enterOtpStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordEnterOtpBlocStateCopyWith<
          _$_ForgotPasswordEnterOtpBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
